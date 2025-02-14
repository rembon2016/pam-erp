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
            const isArray = Array.isArray(value);

            if (value) {
                try {
                    const valuesToCheck = isArray ? value : [value];
                    let isBase64 = true;

                    for (const val of valuesToCheck) {
                        if (!(val.length % 4 === 0 && /^[A-Za-z0-9+/]+={0,2}$/.test(val))) {
                            isBase64 = false;
                            break;
                        }
                        
                        try {
                            atob(val);
                        } catch(e) {
                            isBase64 = false;
                            break;
                        }
                    }

                    if(isBase64) {
                        if (isArray) {
                            let names = [];
                            value.forEach(item => {
                                const decodedValue = atob(item).split('|');
                                names.push(decodedValue[decodedValue.length - 1]); 
                            });
            
                            if (names.length > 0) {
                                filterValues.push(`${filter.label} : <span class="fw-bold">${names.join(',')}</span>`);
                            }
                        } else if (value) {
                            const decodedValue = atob(value).split('|');
                            const name = decodedValue[decodedValue.length - 1]; 
            
                            if (name) {
                                filterValues.push(`${filter.label} : <span class="fw-bold">${name}</span>`);
                            }
                        }
                    } else {
                        filterValues.push(`${filter.label} : <span class="fw-bold">${Array.isArray(value) ? value.join(', ') : value}</span>`);
                    }
                } catch (error) {
                    console.error('Error processing values:', error);
                }
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