<?php

declare(strict_types=1);

namespace App\Http\Filters\COA;

use Illuminate\Database\Eloquent\Builder;

final class SearchFilter
{
    /**
     * Filters the query builder
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $builder  The query builder to filter.
     * @param  \Closure  $next  The next filter in the chain.
     * @return \Illuminate\Database\Eloquent\Builder The filtered query builder.
     */
    public function handle(Builder $builder, \Closure $next): Builder
    {
        return $next($builder)
            ->when(request()->has('search'), function ($q) {
                return $q->where(function ($query) {
                    $searchTerm = '%' . request('search') . '%';

                    // Search in AccountGroup
                    $query->where('name', 'ilike', $searchTerm)
                        ->orWhere('code', 'ilike', $searchTerm)
                        // Search in SubAccountGroup
                        ->orWhereHas('subAccountGroups', function ($subQuery) use ($searchTerm) {
                            $subQuery->where('name', 'ilike', $searchTerm)
                                ->orWhere('code', 'ilike', $searchTerm);
                        })
                        // Search in ChartOfAccounts
                        ->orWhereHas('subAccountGroups.chartOfAccounts', function ($coaQuery) use ($searchTerm) {
                            $coaQuery->where('account_number', 'ilike', $searchTerm)
                                ->orWhere('account_name', 'ilike', $searchTerm);
                        });
                });
            });
    }
}
