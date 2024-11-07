const getOriginFilter = async (param = '') => {
    try {
        if(param == ''){
            params = param_shipment.substring(1);
        }else{
            params = param_shipment;
        }
      const res = await axios.get(
        `${origin}api/shippinginstruction/origin?${param}${params}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

const getPortFilter = async (param = '') => {
    try {
        if(param == ''){
            params = param_shipment.substring(1);
        }else{
            params = param_shipment;
        }
      const res = await axios.get(
        `${origin}api/shippinginstruction/portdestination?${param}${params}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};


const getVesselFilter = async (param = '') => {
    try {
        if(param == ''){
            params = param_shipment.substring(1);
        }else{
            params = param_shipment;
        }
      const res = await axios.get(
        `${origin}api/shippinginstruction/vessel?${param}${params}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

const getEtaFilter = async (param = '') => {
    try {
        if(param == ''){
            params = param_shipment.substring(1);
        }else{
            params = param_shipment;
        }
      const res = await axios.get(
        `${origin}api/shippinginstruction/etamerge?${param}${params}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};


function initFilter(){
  getOriginFilter()
  .then(data => {
    console.log(data);
    setOptionFilter("#origin",data,"origin_name","origin_name");
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

  getVesselFilter()
  .then(data => {
    setOptionFilter("#vessel",data,"mother_vessel_name","mother_vessel_name");
  })
  .catch(error => {

    console.error(error);
  });

  getEtaFilter()
  .then(data => {
    setOptionFilter("#transit_hub",data,"eta","eta");
  })
  .catch(error => {

    console.error(error);
  });

}

function changeFilter(change){
    var origin = $("#origin").val();
    var port_id = $("#port_id").val();
    var vessel = $("#vessel").val();
    var transit_hub = $("#transit_hub").val();

    var filters = {
        origin_name: origin,
        mother_vessel_name:vessel,
        port_of_destination: port_id,
        eta: transit_hub,
    };

    var queryString = buildFilterParamsQuery(filters);

if(change != "origin"){
    getOriginFilter(queryString)
  .then(data => {
    console.log(data);
    setOptionFilter("#origin",data,"origin_name","origin_name", origin);
  })
  .catch(error => {

    console.error(error);
  });
}

if(change != "port_id"){
  getPortFilter(queryString)
  .then(data => {
    setOptionFilter("#port_id",data,"port_of_destination","port_destination_code",port_id);
  })
  .catch(error => {

    console.error(error);
  });
}

if(change != "vessel"){
  getVesselFilter(queryString)
  .then(data => {
    setOptionFilter("#vessel",data,"mother_vessel_name","mother_vessel_name", vessel);
  })
  .catch(error => {

    console.error(error);
  });
}

if(change != "transit_hub"){
  getEtaFilter(queryString)
  .then(data => {
    setOptionFilter("#transit_hub",data,"eta","eta", transit_hub);
  })
  .catch(error => {

    console.error(error);
  });
}

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
