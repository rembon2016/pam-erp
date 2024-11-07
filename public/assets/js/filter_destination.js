
const getDestinationCountryFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/destination/country?filter=${filter}&filter_value=${filter_value}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};


const getPortFilter = async (param) => {
    try {
     
      const res = await axios.get(
        `${origin}api/shippinginstruction/portdestination?${param}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

function initDestination(){
    getPortFilter("komoditi_name="+filters_value)
    .then(data => {
      setOptionFilter("#port_id",data,"port_of_destination","port_destination_code");
    })
    .catch(error => {
  
      console.error(error);
    });
  
    getDestinationCountryFilter(filters,filters_value)
    .then(data => {
      setOptionFilter("#country_id",data,"country_id","country_name");
    })
    .catch(error => {
  
      console.error(error);
    });
}

function changeDestination(change){
    var port_id = $("#port_id").val();
    var country_id = $("#country_id").val();

    var filters = {
        port_of_destination: port_id,
        country: country_id,
    };
    
    var filterParams = buildFilterParams(filters);

    var filters_new = {
        port_of_destination: port_id,
        destination_country_id: country_id
    };

    var queryString = buildFilterParamsQuery(filters_new);
    console.log(filterParams.filter);        // Output: origin,port_origin,country_origin,shipper
    console.log(filterParams.filter_value);
    console.log(queryString);

    if(change != "port_id"){
        getPortFilter(queryString)
        .then(data => {
            setOptionFilter("#port_id",data,"port_of_destination","port_destination_code", port_id);
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