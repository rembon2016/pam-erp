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
                return $q->whereHas('chartOfAccounts', function ($query) {
                    return $query->where('account_number', 'like', '%'.request('search').'%')
                        ->orWhere('account_name', 'like', '%'.request('search').'%');
                });
            });
    }
}
