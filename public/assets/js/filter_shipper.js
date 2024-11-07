const getShipperFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${origin}api/shippinginstruction/shipper?filter=${filter}&filter_value=${filter_value}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

const getOriginOfficeFilter = async (param) => {
    try {
     
      const res = await axios.get(
        `${origin}api/shippinginstruction/originoffice?${param}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

const getOriginCountryFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/origin/country?filter=${filter}&filter_value=${filter_value}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

const getOriginPortFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/origin/port?filter=${filter}&filter_value=${filter_value}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

function initShipper(){
    getShipperFilter()
  .then(data => {
    setOptionFilter("#shipper_id",data,"from_shipper","shipper_name");
  })
  .catch(error => {

    console.error(error);
  });
    getOriginOfficeFilter()
    .then(data => {
        setOptionFilter("#origin_office",data,"office_id","office_name");
    })
    .catch(error => {

    });

    getOriginCountryFilter()
    .then(data => {
        setOptionFilter("#origin_country",data,"country_id","country_name");
    })
    .catch(error => {

    });

    getOriginPortFilter()
    .then(data => {
        setOptionFilter("#origin_port",data,"port_id","port_name");
    })
    .catch(error => {

    });

}

function changeShipper(change){
    var shipper_id = $("#shipper_id").val();
    var origin_office = $("#origin_office").val();
    var origin_country = $("#origin_country").val();
    var origin_port = $("#origin_port").val();

    var filters = {
        origin: origin_office,
        port_origin: origin_port,
        country_origin: origin_country,
        shipper: shipper_id
    };
    
    var filterParams = buildFilterParams(filters);

    var filters_new = {
        origin_id: origin_office,
        from_shipper: shipper_id,
        country_origin: origin_country,
        port_origin: origin_port
    };

    var queryString = buildFilterParamsQuery(filters_new);
    console.log(filterParams.filter);        // Output: origin,port_origin,country_origin,shipper
    console.log(filterParams.filter_value);
    console.log(queryString);

    if(change != "shipper"){
        getShipperFilter(filterParams.filter, filterParams.filter_value)
        .then(data => {
            setOptionFilter("#shipper_id",data,"from_shipper","shipper_name",shipper_id);
        
        })
        .catch(error => {

            console.error(error);
        });
    }

    if(change != "origin"){
        getOriginOfficeFilter(queryString)
        .then(data => {
            setOptionFilter("#origin_office",data,"office_id","office_name",origin_office);
            if(origin_office == ""){
                $("#origin_office").val(origin_office);
            }
        })
        .catch(error => {

        });
    }
    if(change != "country"){
    getOriginCountryFilter(filterParams.filter, filterParams.filter_value)
    .then(data => {
        setOptionFilter("#origin_country",data,"country_id","country_name",origin_country);
        if(origin_country == ""){
            $("#origin_country").val(origin_country);
        }
    })
    .catch(error => {

    });
    }
    if(change != "port"){
    getOriginPortFilter(filterParams.filter, filterParams.filter_value)
    .then(data => {
        setOptionFilter("#origin_port",data,"port_id","port_name",origin_port);
        if(origin_port == ""){
            $("#origin_port").val(origin_port);
        }
    })
    .catch(error => {

    });
    }

  return true;
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