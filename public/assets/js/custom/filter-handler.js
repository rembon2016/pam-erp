class FilterHandler {
    constructor(config = {}) {
        this.filterResultClass = config.filterResultClass || 'filter-result';
        this.filterValuesClass = config.filterValuesClass || 'filter-values';
        this.clearFilterClass = config.clearFilterClass || 'clear-filter';
        this.filters = config.filters || [];
        this.init();
    }

    init() {
        this.setupClearFilter();
        this.updateFilterResult();
    }

    getUrlParameter(name) {
        const urlParams = new URLSearchParams(window.location.search);
        
        if (name.endsWith('[]')) {
            const values = urlParams.getAll(name).filter(value => value !== '');
            return values.length > 0 ? values : null;
        }
        
        const value = urlParams.get(name);
        return value && value !== '' ? value : null;
    }

    updateFilterResult() {
        let filterValues = [];
        
        this.filters.forEach(filter => {
            const value = this.getUrlParameter(filter.name);
            if (value) {
                filterValues.push(`${filter.label} : <span class="fw-bold">${Array.isArray(value) ? value.join(', ') : value}</span>`);
            }
        });

        if (filterValues.length > 0) {
            $(`.${this.filterResultClass}`).show();
            $(`.${this.filterValuesClass}`).html(filterValues.join(' , '));
            $(`.${this.clearFilterClass}`).removeClass('d-none');
        } else {
            $(`.${this.filterResultClass}`).hide();
            $(`.${this.clearFilterClass}`).addClass('d-none');
        }
    }

    setupClearFilter() {
        $(`.${this.clearFilterClass}`).on('click', () => {
            window.location.href = window.location.pathname;
        });
    }
} 