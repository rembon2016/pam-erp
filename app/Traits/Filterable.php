<?php

namespace App\Traits;

trait Filterable
{
    private function isAssocFilterable(array $arr)
    {
        if ($arr === []) {
            return false;
        }

        return array_keys($arr) !== range(0, count($arr) - 1);
    }

    private function isFilterAvailable($filter, $filter_fields = [])
    {
        if (empty($this->filter_fields)) {
            if (empty($filter_fields)) {
                return false;
            }
        }
        $filter_field_arr = $this->filter_fields;
        if (! empty($filter_fields)) {
            if ($this->isAssocFilterable($filter_fields)) {
                $filter_field_arr = array_keys($filter_fields);
            } else {
                $filter_field_arr = $filter_fields;
            }
        }
        foreach ($filter_field_arr as $i) {
            if ($i == $filter) {
                return $i;
            }
        }

        return false;
    }

    private function getDateFormatFilter()
    {
        if (empty($this->filter_date_format)) {
            return 'Y-m-d';
        }

        return $this->filter_date_format;
    }

    private function validateDate($date, $format = 'Y-m-d')
    {
        $d = \DateTime::createFromFormat($format, $date);

        // The Y ( 4 digits year ) returns TRUE for any integer with any number of digits so changing the comparison from == to === fixes the issue.
        return $d && $d->format($format) === $date;
    }

    public function scopeFilter($query, $fields, $filter_fields = [], $operator = 'and', $overide_query = null)
    {
        if ($overide_query != null) {
            $query = $overide_query;
        }
        foreach ($fields as $key => $i) {
            if ($filter = $this->isFilterAvailable($key, $filter_fields)) {
                if (substr($i, 0, 1) != '!') {
                    if (substr($i, 0, 4) == 'btw:') {
                        $param_arr = explode(',', substr($i, 4));
                        if (count($param_arr) != 2) {
                            continue;
                        }

                        $start = $param_arr[0];
                        $end = $param_arr[1];
                        if (empty($param_arr[0]) || empty($param_arr[1])) {
                            continue;
                        }
                        // switch $start must be less than $end
                        if ($start > $end) {
                            $tmp = $start;
                            $start = $end;
                            $end = $tmp;
                        }
                        if (is_numeric($start)) {
                            if ($operator == 'or') {
                                $query->orWhere(function ($query2) use ($filter, $start, $end) {
                                    $query2->where($filter, '>=', $start);
                                    $query2->where($filter, '<=', $end);
                                });
                            } else {
                                $query->where($filter, '>=', $start);
                                $query->where($filter, '<=', $end);
                            }
                        } elseif ($this->validateDate($start, $this->getDateFormatFilter())) {
                            if ($operator == 'or') {
                                $query->orWhere(function ($query2) use ($filter, $start, $end) {
                                    $query2->where($filter, '>=', $start);
                                    $query2->where($filter, '<=', ($this->getDateFormatFilter() == 'Y-m-d' ? $end.' 23:59:59' : $end));
                                });
                            } else {
                                $query->where($filter, '>=', $start);
                                $query->where($filter, '<=', ($this->getDateFormatFilter() == 'Y-m-d' ? $end.' 23:59:59' : $end));
                            }
                        } else {
                            continue;
                        }
                    } elseif (substr($i, 0, 3) == 'in:') {
                        $arr = explode(',', substr($i, 3));
                        $out = [];
                        $have_null = false;
                        foreach ($arr as $j) {
                            if ($j != null && $j != 'null') {
                                $out[] = $j;
                            } else {
                                $have_null = true;
                            }
                        }
                        if (! $have_null) {
                            if ($operator == 'or') {
                                $query->orWhereIn($filter, $out);
                            } else {
                                $query->whereIn($filter, $out);
                            }
                        } else {
                            if ($operator == 'or') {
                                $query->orWhere(function ($q) use ($filter, $out) {
                                    $q->whereIn($filter, $out);
                                    $q->orWhereNull($filter);
                                });
                            } else {
                                $query->where(function ($q) use ($filter, $out) {
                                    $q->whereIn($filter, $out);
                                    $q->orWhereNull($filter);
                                });
                            }
                        }
                    } elseif (in_array(substr($i, 0, 2), ['<=', '>='])) {
                        if ($this->validateDate(substr($i, 2), $this->getDateFormatFilter())) {
                            if ($this->getDateFormatFilter() === 'Y-m-d') {
                                if (substr($i, 0, 2) == '<=') {
                                    if ($operator == 'or') {
                                        $query->orWhere($filter, substr($i, 0, 2), substr($i, 2).' 23:59:59');
                                    } else {
                                        $query->where($filter, substr($i, 0, 2), substr($i, 2).' 23:59:59');
                                    }
                                } else {
                                    if ($operator == 'or') {
                                        $query->orWhere($filter, substr($i, 0, 2), substr($i, 2).' 00:00:00');
                                    } else {
                                        $query->where($filter, substr($i, 0, 2), substr($i, 2).' 00:00:00');
                                    }
                                }
                            } else {
                                if ($operator == 'or') {
                                    $query->orWhere($filter, substr($i, 0, 2), substr($i, 2));
                                } else {
                                    $query->where($filter, substr($i, 0, 2), substr($i, 2));
                                }
                            }
                        } else {
                            if ($operator == 'or') {
                                $query->orWhere($filter, substr($i, 0, 2), substr($i, 2));
                            } else {
                                $query->where($filter, substr($i, 0, 2), substr($i, 2));
                            }
                        }
                    } elseif (in_array(substr($i, 0, 1), ['<', '>'])) {
                        if ($this->getDateFormatFilter() === 'Y-m-d') {
                            if (substr($i, 0, 1) == '<') {
                                if ($operator == 'or') {
                                    $query->orWhere($filter, substr($i, 0, 1), substr($i, 1).' 00:00:00');
                                } else {
                                    $query->where($filter, substr($i, 0, 1), substr($i, 1).' 00:00:00');
                                }
                            } else {
                                if ($operator == 'or') {
                                    $query->orWhere($filter, substr($i, 0, 1), substr($i, 1).' 23:59:59');
                                } else {
                                    $query->where($filter, substr($i, 0, 1), substr($i, 1).' 23:59:59');
                                }
                            }
                        } else {
                            if ($operator == 'or') {
                                $query->orWhere($filter, substr($i, 0, 1), substr($i, 1));
                            } else {
                                $query->where($filter, substr($i, 0, 1), substr($i, 1));
                            }
                        }
                    } elseif ($i == 'null' || $i === null) {
                        if ($operator == 'or') {
                            $query->orWhereNull($filter);
                        } else {
                            $query->whereNull($filter);
                        }
                    } elseif ($this->validateDate($i, $this->getDateFormatFilter()) && $this->getDateFormatFilter() === 'Y-m-d') {
                        if ($operator == 'or') {
                            $query->orWhereBetween($filter, ["$i 00:00:00", "$i 23:59:59"]);
                        } else {
                            $query->whereBetween($filter, ["$i 00:00:00", "$i 23:59:59"]);
                        }
                    } else {
                        if ($operator == 'or') {
                            $query->orWhere($filter, 'ilike', $i);
                        } else {
                            $query->where($filter, 'ilike', $i);
                        }
                    }
                } else {
                    if (substr($i, 1, 3) == 'in:') {
                        $arr = explode(',', substr($i, 4));
                        $out = [];
                        $have_null = false;
                        foreach ($arr as $j) {
                            if ($j != null && $j != 'null') {
                                $out[] = $j;
                            } else {
                                $have_null = true;
                            }
                        }
                        if (! $have_null) {
                            $query->whereNotIn($filter, $out);
                        } else {
                            $query->where(function ($q) use ($filter, $out) {
                                $q->whereNotIn($filter, $out);
                                $q->whereNotNull($filter);
                            });
                        }
                    } elseif (in_array(substr($i, 1, 2), ['<=', '>='])) {
                        $query->whereNot($filter, substr($i, 1, 2), substr($i, 3));
                    } elseif (in_array(substr($i, 1, 1), ['<', '>'])) {
                        $query->whereNot($filter, substr($i, 1, 1), substr($i, 2));
                    } elseif (substr($i, 1) == 'null' || substr($i, 1) === null) {
                        $query->whereNotNull($filter);
                    } else {
                        $query->whereNot($filter, substr($i, 1));
                    }
                }
            }
        }

        return $query;
    }
}
