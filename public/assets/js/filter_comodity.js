const getDestinationCountryFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/destination/country?comodity=true&filter=${filter}&filter_value=${filter_value}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

const getComodityFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/si-overview/comodity?role_id=99&filter=${filter}&filter_value=${filter_value}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

function initComodity(){
    getComodityFilter()
    .then(data => {
      setOptionFilter("#comodity",data,"comodity_name","comodity_name");
    })
    .catch(error => {
  
      console.error(error);
    });
  
    getDestinationCountryFilter()
    .then(data => {
      setOptionFilter("#country_id",data,"country_id","country_name");
    })
    .catch(error => {
  
      console.error(error);
    });
}


function changeComodity(change){
    var comodity = $("#comodity").val();
    var country_id = $("#country_id").val();

    var filters = {
        commodity: comodity,
        country: country_id,
        
    };
    
    var filterParams = buildFilterParams(filters);


    if(change != "comodity"){
        getComodityFilter(filterParams.filter, filterParams.filter_value)
        .then(data => {
            setOptionFilter("#comodity",data,"comodity_name","comodity_name",comodity);
        })
        .catch(error => {

            console.error(error);
        });
    }


    if(change != "country_id"){
        getDestinationCountryFilter(filterParams.filter, filterParams.filter_value)
        .then(data => {
            setOptionFilter("#country_id",data,"country_id","country_name", country_id);
        })
        .catch(error => {

            console.error(error);
        });
    }
}

function buildFilterParams(filters) {
    var filter = '';
    var filter_value = '';

    Object.entries(filters).forEach(([key, value]) => {
        if (value && value !== '-') {
            if (filter !== '') {
                filter += ',';
                filter_value += ',';
            }
            filter += key;
            filter_value += value;
        }
    });
    filter.replaceAll("sales_office","sales-office");
    return {
        filter,
        filter_value
    };
}

function buildFilterParamsQuery(filters) {
    var queryString = '';

    Object.entries(filters).forEach(([key, value]) => {
        if (value && value !== '-') {
            if (queryString !== '') {
                queryString += '&';
            }
            queryString += `${key}=${value}`;
        }
    });

    return queryString;
}

function setOptionFilter(id, data, value, title, value_awal = '') {
    var htm = '<option>-</option>';
    
    Object.entries(data).forEach(([key, x]) => {
        htm += `
            <option value="${x[value]}">${x[title]}</option>      
        `;
    });

    $(id).html(htm);

    if(value_awal != ''){
        $(id).val(value_awal);
    }
}