class ClearFilterHandler {
    constructor(options = {}) {
        this.options = {
            filterResultClass: '.filter-result',
            clearFilterButtonId: '#clear-filter-btn',
            resetFilterButtonId: '#reset-filter-btn',
            select2Fields: [],
            datatableInstance: null,
            ...options
        };
        
        this.initialize();
    }

    initialize() {
        $(this.options.clearFilterButtonId + ', ' + this.options.resetFilterButtonId).on('click', (e) => {
            e.preventDefault();
            this.clearFilters();
        });
    }

    clearFilters() {
        if (this.options.select2Fields.length > 0) {
            this.options.select2Fields.forEach(field => {
                $(`#${field}`).val(null).trigger('change');
            });
        }
        
        const baseUrl = window.location.pathname;
        window.history.pushState({}, '', baseUrl);

        window.location.reload();

        if (this.options.datatableInstance) {
            this.options.datatableInstance.search('').columns().search('');
            this.options.datatableInstance.ajax.reload(() => {
                $(this.options.filterResultClass).hide();
                $(`${this.options.filterResultClass} .filter-values`).empty();
            }, false);
        }

        $('.sidebar-closes').click();
    }
}

window.ClearFilterHandler = ClearFilterHandler; 