const getSalesOfficeFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${origin}api/shippinginstruction/salesoffice?filter=${filter}&filter_value=${filter_value}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

const getTransitViaFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${origin}api/shippinginstruction/transitvia?filter=${filter}&filter_value=${filter_value}`,
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

function initOrigin(){
    getSalesOfficeFilter()
  .then(data => {
    setOptionFilter("#sales_office",data,"sales_office_name","sales_office_name");
  })
  .catch(error => {

    console.error(error);
  });

  getTransitViaFilter()
  .then(data => {
    setOptionFilter("#transit_via",data,"transit_via","transit_via");
  })
  .catch(error => {

    console.error(error);
  });

  getPortFilter()
  .then(data => {
    setOptionFilter("#port_id",data,"port_of_destination","port_destination_code");
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

function changeOrigin(change){
    var sales_office = $("#sales_office").val();
    var transit_via = $("#transit_via").val();
    var port_id = $("#port_id").val();
    var country_id = $("#country_id").val();
    var origin_office = $("#origin_office").val();
    var origin_country = $("#origin_country").val();
    var origin_port = $("#origin_port").val();

    // var start_date = $("#start_date").val();
    // var end_date = $("#end_date").val();
    // var year = $("#year").val();
    // var service = $("#service").val();
    // var freightterm = $("#freightterm").val();
    // var periode = "";
    // if(start_date != "" && end_date != ""){
    //     start_end = start_date+"."+end_date;
        
    // }

    var filters = {
        origin: origin_office,
        port_origin: origin_port,
        country_origin: origin_country,
        sales_office: sales_office,
        routing:transit_via,
        port_of_destination: port_id,
        country: country_id,
    };
    
    var filterParams = buildFilterParams(filters);

    var filters_new = {
        origin_id: origin_office,
        country_origin: origin_country,
        port_origin: origin_port,
        port_of_destination: port_id,
        sales_office_name: sales_office,
        transit_via: transit_via,
        destination_country_id: country_id
    };

    var queryString = buildFilterParamsQuery(filters_new);
    console.log(filterParams.filter);        // Output: origin,port_origin,country_origin,shipper
    console.log(filterParams.filter_value);
    console.log(queryString);

    if(change != "sales_office"){
        getSalesOfficeFilter(filterParams.filter, filterParams.filter_value)
        .then(data => {
            setOptionFilter("#sales_office",data,"sales_office_name","sales_office_name",sales_office);
        
        })
        .catch(error => {

            console.error(error);
        });
    }
    if(change != "transit_via"){
        getTransitViaFilter(filterParams.filter, filterParams.filter_value)
        .then(data => {
            setOptionFilter("#transit_via",data,"transit_via","transit_via", transit_via);
        })
        .catch(error => {

            console.error(error);
        });
    }

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