const getInitialData = async (filter = '', filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/si-overview/destination-country?role_id=99&field=&limit=5&filter=${filter}&filter_value=${filter_value}`
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
  };

  const getListData = async (filter = '', filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/si-overview/destination-country?role_id=99&field=&limit=&page=&filter=${filter}&filter_value=${filter_value}`
      );
      const data = res?.data;
      return data;
    } catch (error) {
      console.log(error);
    }
  };

    

getInitialData(filters,filters_value)
  .then(data => {
    console.log(data);
    chartBar(data);
  })
  .catch(error => {

    console.error(error);
  });
getListData(filters,filters_value)
  .then(data => {
    console.log(data);
    $("#total-data").html("<h3>Total Data : " +data.records.totalData+"<h3>");
    TableData(data.data,data.total);
    chartAllData(data.data,"destination");
  })
  .catch(error => {

    console.error(error);
  });
function numberWithCommas(x) {
    return x?.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
const textCapitalize = (x) => {
    if (x == undefined || x == "" || x == null) {
      return;
    }
    const lowerText = x.toLowerCase();
    const arr = lowerText.split(" ");
    for (var i = 0; i < arr.length; i++) {
      arr[i] = arr[i].charAt(0).toUpperCase() + arr[i].slice(1);
    }
    const str2 = arr.join(" ");
    return str2;
  };
function convertNumberFormat(number) {
  if (number !== undefined) {
    var convertedNumber = number?.toString().replace(".", ".");
    var parts = convertedNumber?.split(",");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts?.join(",");
  }
}
const flagIcon = (x) => {
    // return "jp.svg"
    if (x == "JAPAN") {
      return "jp.svg";
    }
    if (x == "UNITED KINGDOM") {
      return "gb.svg";
    }
    return "ae.svg";
  };
function chartBar(data){
  var datas  = data;
    const optionsBar = {
    chart: {
      events: {
        click: function (e) {
          const eventClick = this.series[0]?.searchPoint(e, true);
          const categoryName = this.series[0]?.searchPoint(e, true)?.category;
          const categoryIndex = this.series[0]?.searchPoint(e, true)?.index;

          const data = datas?.map((x, i) => {
            return {
              id: x?.country_id,
              name: x?.country_name,
              index: i,
            };
          });
          if(mode == 'comodity'){
            window.location.href="/pds/chart/detail?mode=comodity&id="+data[categoryIndex]?.id+"&name="+data[categoryIndex]?.name+"&commodity="+filters_value;
          }else{
            window.location.href="/pds/chart/detail?mode=country&id="+data[categoryIndex]?.id+"&name="+data[categoryIndex]?.name;
          }
              
         
        },
      },
      backgroundColor: {
        linearGradient: [0, 300, 5000, 1000],
        stops: [
          [0, "rgb(255, 255, 255)"],
          [1, "lightblue"],
        ],
      },
      type: "column",
      style: {
        fontFamily: "Roboto",
      },
    },
    title: {
      text: "",
      align: "left",
      // x: 10,
      y: 5,
      style: {
        fontSize: "16px",
      },
    },
    credits: {
      enabled: false, // show watermark highchart
    },
    plotOptions: {
      column: {
        allowPointSelect: true,
        pointPadding: 0.3, //width column
        borderWidth: 0,
        cursor: "pointer",
        dataLabels: {
          enabled: false, //show data diatas grafik
          style: {
            fontSize: "9px",
            color: "gray",
            fontWeight: 300,
            textOverflow: "clip",
          },
        },
      },
    },
    xAxis: {
      labels: {
        enabled: true, // show label bawah
      },
      categories: data?.map((row, i) => {
        return [row?.country_name];
      }),
      keys: ["x"],
      crosshair: true, // shadow di belakang ketika hover chart
    },
    yAxis: {
      gridLineColor: "rgb(192,192,192, 0.2)",
      // gridLineWidth: 1,
      title: {
        text: "", // show label samping
      },
      min: 0, //minimal dari 0
      // max: 100 // maximal sampe
    },
    tooltip: {
      headerFormat: `<div style="font-size:10px; background: rgba(0,0,0,0.1); padding:4px 10px; display: flex; justify-content: center; align-items:center; border-radius:20px; text-transform:uppercase;"><img src="/country/{point.x}.svg" alt="flag" width="18" height="18" style="margin-right:5px;"/>{point.x}</div><div>`,
      pointFormat:
        '<div style="margin-top:5px;"><div style="color:{series.color}; padding: 0">Chargeable weight :<span style="color: darkcyan; font-weight: 600;"> {point.valuewithcoma}</span></div>' +
        '<div style="font-size:11px; font-weight:400;">(Click to see detail)</div>',
      footerFormat: "</div>",
      shared: true,
      useHTML: true,
    },
    series: [
      {
        point: {
          events: {
            click: function (e) {
              const index = this.index;
              const data = datas?.map((x, i) => {
                return {
                  id: x?.country_id,
                  name: x?.country_name,
                  index: i,
                };
              });
              if(mode == 'comodity'){
                window.location.href="/pds/chart/detail?mode=comodity&id="+data[index]?.id+"&name="+data[index]?.name+"&commodity="+filters_value;
              }else{
                window.location.href="/pds/chart/detail?mode=country&id="+data[index]?.id+"&name="+data[index]?.name;
              }
              
            },
          },
        },
        name: `Data Chart Destination Country`,
        color: {
          linearGradient: {
            x1: 0,
            x2: 0,
            y1: 0,
            y2: 1,
          },
          stops: [
            [0, "darkcyan"],
            [1, "orange"],
          ],
        },
        showInLegend: true, //show title series
        animation: {
          duration: 1000,
          // easing: "easeOutBounce",
        },
        // data: [11, 20, 100, 80, 7, 25, 45, 110, 12, 14, 50, 60],
        data: data?.map((data) => {
          return [
            parseFloat(data?.value),
            numberWithCommas(data?.cw.toFixed(0)),
            data?.cbm.toFixed(0),
            data?.gw,
            data?.teus,
            data?.ctd,
            flagIcon(data?.label),
            numberWithCommas(data?.value.toFixed(0)),
          ];
        }),
        keys: [
          "y",
          "cw",
          "cbm",
          "gw",
          "teus",
          "ctd",
          "icon",
          "valuewithcoma",
          "color",
        ],
        dataLabels: {
          enabled: false, // show data diatas grafik
          color: "#000000",
          align: "right",
          x: -10,
          y: 20,
          style: {
            font: "normal 13px Verdana, sans-serif",
          },
        },
      },
    ],
    events: {
      setExtremes: function (event) {
        if (series.length > 0)
          zoomSync.chartZoomed.call(
            zoomSync,
            series[0].chart,
            event.min,
            event.max
          );
      },
    },
  };
      Highcharts.chart('chart-country', optionsBar);
   
}

function TableData(data, total){
     var html = '';
    var no = 1;
    data.map((data) => {
        html += `
            <tr>
                <td>${no}</td>
                <td>${data.country_name}</td>
                <td>${convertNumberFormat(data.gw)}</td>
                <td>${convertNumberFormat(data.cbm)}</td>
                <td>${convertNumberFormat(data.cw)}</td>
                <td>${convertNumberFormat(data.ctd)}</td>
            </tr>
        `;
        no++;
    });
    html += `
        <tr>
            <th colspan="2" style="text-align:center">Total</th>
            <th>${convertNumberFormat(total.total_gw)}</th>
            <th>${convertNumberFormat(total.total_cbm)}</th>
            <th>${convertNumberFormat(total.total_chw)}</th>
            <th>${convertNumberFormat(total.total_ctd)}</th>
        </tr>
    `;
    $("#chart-table").html(html);
}

function buildFilterParams2(filters) {
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

$( "#filter" ).on( "click", function() {
    var start_date = $("#start_date").val();
    var end_date = $("#end_date").val();
    var year = $("#year").val();
    var service = $("#service").val();
    var port_id = $("#port_id").val();
    var country_id = $("#country_id").val();

    var periode = "";
    if(start_date != "" && end_date != ""){
        periode = start_date+"."+end_date;
        
    }



    var filters = {
        range: periode,
        year: year,
        service: service,
        port_of_destination: port_id,
        country: country_id,
        commodity: filters_value
    };

    var filterParams = buildFilterParams2(filters);
    $('#chart-country').highcharts().destroy();
    getInitialData(filterParams.filter.replace("freightterm","freight-term"), filterParams.filter_value)
  .then(data => {
    console.log(data);
    chartBar(data);
  })
  .catch(error => {

    console.error(error);
  });
getListData(filterParams.filter.replace("freightterm","freight-term"), filterParams.filter_value)
  .then(data => {
    console.log(data);
    $("#total-data").html("<h3>Total Data : " +data.records.totalData+"<h3>");
    TableData(data.data,data.total);
  })
  .catch(error => {

    console.error(error);
  });

});

$("#download").on( "click", async function() {
    var start_date = $("#start_date").val();
    var end_date = $("#end_date").val();
    var year = $("#year").val();
    var service = $("#service").val();
    var port_id = $("#port_id").val();
    var country_id = $("#country_id").val();

    var periode = "";
    if(start_date != "" && end_date != ""){
        periode = start_date+"."+end_date;
        
    }

    var filters = {
        range: periode,
        year: year,
        service: service,
        port_of_destination: port_id,
        country: country_id,
        download:true,
        commodity:filters_value,
    };

    var filterParams = buildFilterParams2(filters);
    const apiUrl = `${user}api/dashboard/si-overview/destination-country?role_id=99&field=&limit=&page=&filter=${filterParams.filter}&filter_value=${filterParams.filter_value}&download=true`;

    await downloadFileExcel(apiUrl, "Destination");
  
  });
  
  const downloadFileExcel = async (apiUrl, fileName) => {
    try {
        const response = await axios.get(apiUrl, { responseType: "blob" });
        const blob = response.data;
  
        const url = window.URL.createObjectURL(new Blob([blob]));
        const link = document.createElement("a");
        link.href = url;
        link.setAttribute("download", `${fileName}-${Date.now()}.xlsx`);
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
  
    } catch (error) {
        console.error("Error downloading file:", error);
    }
  };
  