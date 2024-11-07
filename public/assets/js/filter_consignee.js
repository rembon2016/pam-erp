const getConsigneeFilter = async (filter = '',filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/consignee/group?filter=${filter}&filter_value=${filter_value}`,
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
};

function initConsignee(){
    getConsigneeFilter()
  .then(data => {
    setOptionFilter("#group_id",data,"customer_group_id","customer_group_name");
  })
  .catch(error => {

    console.error(error);
  });

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