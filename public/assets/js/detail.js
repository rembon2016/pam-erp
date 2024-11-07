const getInitialData = async (group='',filter = '', filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/si-overview/${api}?role_id=99&group=${group}&group_filter=${group_filter}&limit=5&filter=${filter}&filter_value=${filter_value}`
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
  };

  const getShipmentType = async (group='',group_value = '',filter = '', filter_value = '') => {
    try {
     
      const res = await axios.get(
        `${user}api/dashboard/si-overview/shipment-type?role_id=99&group=${group}&group_filter=${group_value}&limit=5&filter=${filter}&filter_value=${filter_value}`
      );
      const data = res?.data.data;
      return data;
    } catch (error) {
      console.log(error);
    }
  };

  getInitialData("year",filters,filters_value)
  .then(data => {
    console.log(data);
    chartBar(data);
  })
  .catch(error => {

    console.error(error);
  });

  initDetail();

  async function initDetail(){
    var filter_new;
    if(mode == 'origin'){
      filter_new = {
          origin: group_filter,
          commodity: filters_value 
      }
    }else if(mode == 'country'){
      filter_new = {
        country: group_filter,
      }
    }else if(mode == 'comodity'){
      filter_new = {
        commodity: filters_value,
        country: group_filter, 
      }
    }
    var filterParams = buildFilterParams(filter_new);

    var seaair = await getShipmentType("year","SEAAIR",filterParams.filter,filterParams.filter_value);
    var air = await getShipmentType("year","AIR",filterParams.filter,filterParams.filter_value);

    chartLine(seaair,air);
    
  }

  $("#group").change(function(){
    var group = $(this).val();
    if(group != "year"){
        $("#filter_bar").hide();
    }else{
        $("#filter_bar").show();
    }

    $('#chart-detail').highcharts().destroy();

    getInitialData(group,filters,filters_value)
    .then(data => {
      console.log(data);
      var time = "";
      if(group == 'month'){
        time = 'month';
      }else if(group == 'week'){
        time = 'week';
      }
      chartBar(data,time);
    })
    .catch(error => {
  
      console.error(error);
    });



  });

  $("#group_line").change(async function(){
    var group = $(this).val();
    if(group != "year"){
        $("#filter_line").hide();
    }else{
        $("#filter_line").show();
    }

    $('#chart-line').highcharts().destroy();

    var filter_new = {
        origin: group_filter,
        commodity: filters_value 
    }
    var filterParams = buildFilterParams(filter_new);

    var seaair = await getShipmentType(group,"SEAAIR",filterParams.filter,filterParams.filter_value);
    var air = await getShipmentType(group,"AIR",filterParams.filter,filterParams.filter_value);

    var time = "";
      if(group == 'month'){
        time = 'month';
      }else if(group == 'week'){
        time = 'week';
      }

    chartLine(seaair,air,time);



  });

  $( "#filter_line" ).on( "click", async function() {
    var group = $("#group_line").val();
    var start_date = $("#start_date_line").val();
    var end_date = $("#end_date_line").val();
   

    var periode = "";
    if(start_date != "" && end_date != ""){
        periode = start_date+"."+end_date;
        
    }

    console.log(start_date);
    console.log(end_date);
    console.log(periode);

    var filter_new = {
        origin: group_filter,
        commodity: filters_value,
        range: periode 
    }
    var filterParams = buildFilterParams(filter_new);

    $('#chart-line').highcharts().destroy();

    var seaair = await getShipmentType(group,"SEAAIR",filterParams.filter,filterParams.filter_value);
    var air = await getShipmentType(group,"AIR",filterParams.filter,filterParams.filter_value);

    var time = "";
      if(group == 'month'){
        time = 'month';
      }else if(group == 'week'){
        time = 'week';
      }

    chartLine(seaair,air,time);



});

$( "#filter" ).on( "click", function() {
    var group = $("#group").val();
    var start_date = $("#start_date").val();
    var end_date = $("#end_date").val();
   

    var periode = "";
    if(start_date != "" && end_date != ""){
        periode = start_date+"."+end_date;
        
    }

    var filter_new = {
        origin: group_filter,
        commodity: filters_value,
        range: periode 
    }
    var filterParams = buildFilterParams(filter_new);

    $('#chart-detail').highcharts().destroy();

    getInitialData(group,filterParams.filter,filterParams.filter_value)
    .then(data => {
      console.log(data);
      var time = "";
      if(group == 'month'){
        time = 'month';
      }else if(group == 'week'){
        time = 'week';
      }
      chartBar(data, time);
    })
    .catch(error => {
  
      console.error(error);
    });



});

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

function chartLine(dataSeaAir, dataAir, time = ''){
    const optionsLine = {
        chart: {
          backgroundColor: {
            linearGradient: [0, 300, 5000, 1000],
            stops: [
              [0, "rgb(255, 255, 255)"],
              [1, "lightblue"],
            ],
          },
          type: "line",
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
          line: {
            allowPointSelect: true,
            size: "70%",
            pointPadding: 0.3, //width column
            borderWidth: 0,
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
          categories: dataSeaAir?.map((row) => {
            return [
              time == ""
                ? row?.label
                : time == 0 || time == undefined
                ? "-"
                : time == "month"
                ? `${new Date(row?.label).toLocaleDateString("en-en", {
                    year: "numeric",
                    month: "short",
                    // day: "numeric",
                  })}`
                : time == "week"
                ? `Week ${row?.week}/${row?.year}`
                : row?.label,
            ];
          }),
          crosshair: false, // shadow di belakang ketika hover chart
        },
        yAxis: {
          gridLineColor: "rgb(192,192,192, 0.2)",
          // gridLineWidth: 1,
          title: {
            text: "Total - CTD", // show label samping
          },
          min: 0, //minimal dari 0
          // max: 100 // maximal sampe 100
        },
        tooltip: {
          // headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
          // pointFormat: '<tr><td style="color:{series.color}; padding: 0"></td>' + '<td style="padding:0; color:{series.color}"><b>{point.y}</b></td></tr>',
          // footerFormat: '</table>',
          headerFormat:
            '<div style="font-size:10px; background: rgba(0,0,0,0.1); padding:4px 10px; display: flex; justify-content: center; border-radius:20px;"><i style="margin-right:5px;" class="far fa-calendar-check"></i>{point.key}</div><div>',
          pointFormat:
            '<div style="margin-top:5px;"><div style="color:{series.color}; padding: 0;"><span style="font-weight: 600;">{series.name} <i style="margin-right:4px; margin-left:4px; color: #474747; font-size:3px; margin-top:0px;" class="fas fa-circle"></i> <span style="color:#474747;">CTD</span> : {point.y}</span></div>',
          footerFormat: "</div>",
          shared: true,
          useHTML: true,
        },
        series: [
          {
            name: "SEA-AIR",
            color: "orange",
            showInLegend: true, //show title series
            animation: {
              duration: 2,
              easing: "easeOutBounce",
            },
            // data: [11, 20, 100, 80, 7, 25, 45, 110, 12, 14, 50, 60],
            data: dataSeaAir?.map((data) => {
              return [data?.ctd, data?.color];
            }),
            keys: ["y", "color"],
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
          {
            name: "CROSS-AIR",
            color: "darkcyan",
            showInLegend: true, //show title series
            animation: {
              duration: 2,
              easing: "easeOutBounce",
            },
            // data: [11, 20, 100, 80, 7, 25, 45, 110, 12, 14, 50, 60],
            data: dataAir?.map((data) => {
              return [data?.ctd, data?.color];
            }),
            keys: ["y", "color"],
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
      };
    Highcharts.chart('chart-line', optionsLine);
}

  function chartBar(data, time = ''){
    var datas = data;
    var group = $("#group").val();
    const optionsBar = {
        chart: {
          events: {
            click: function (e) {
              const categoryIndex = this.series[0]?.searchPoint(e, true)?.index;
              const data = datas?.map((x, i) => {
                return {
                  id: x?.label,
                  index: i,
                };
              });

              if(mode == "origin"){
                window.location.href="/pds/chart/shipment?mode=origin&id="+group_filter+"&value="+data[categoryIndex]?.id+"&group="+group;
              }else if(mode == "country"){
                window.location.href="/pds/chart/shipment?mode=country&id="+group_filter+"&value="+data[categoryIndex]?.id+"&group="+group;
              }else if(mode == "comodity"){
                window.location.href="/pds/chart/shipment?mode=comodity&id="+filters_value+"&country_id="+group_filter+"&value="+data[categoryIndex]?.id+"&group="+group;
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
          // type: time == "week" ? "line" : "column",
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
            pointPadding: 0.05, //width column
            borderWidth: 0,
            cursor: "default",
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
            events: {
              allowOverlap: true,
            },
          },
          categories: data?.map((row, i) => {
            return [
              time == ""
                ? row?.label
                : time == 0 || time == undefined
                ? "-"
                : time == "week"
                ? `Week ${row?.week}/${row?.year}`
                : time == "month"
                ? `${new Date(row?.label).toLocaleDateString("en-en", {
                    year: "numeric",
                    month: "short",
                    // day: "numeric",
                  })}`
                : row?.label,
            ];
          }),
          crosshair: true, // shadow di belakang ketika hover chart
        },
        yAxis: {
          gridLineColor: "rgb(192,192,192, 0.2)",
          // gridLineWidth: 1,
          // opposite: false,
          title: {
            text: "Chargeable weight", // show label samping
          },
          min: 0, //minimal dari 0
          // max: 100 // maximal sampe
          labels: {
            // formatter: function() {
            //   return this.value;
            // },
            // style: {
            //   "color": "#010101",
            //   "fontSize": "12px"
            // }
          },
        },
        tooltip: {
          headerFormat:
            '<div style="font-size:10px; background: rgba(0,0,0,0.1); padding:4px 10px; display: flex; justify-content: center; border-radius:20px;"><i style="margin-right:5px;" class="far fa-calendar-check"></i>{point.key}</div><div>',
          pointFormat:
            '<div style="margin-top:5px;"><div style="color:{series.color}; padding: 0">Chargeable weight :<span style="color: darkcyan; font-weight: 600;"> {point.cw}</span></div>' +
            // '<div><div style="color:{series.color};">CBM :<span style="color: darkcyan; font-weight: 600;"> {point.cbm}</span></div>'+
            '<div><div style="color:{series.color};">TEU :<span style="color: darkcyan; font-weight: 600;"> {point.teus}</span></div>' +
            '<div><div style="color:{series.color};">DOC :<span style="color: darkcyan; font-weight: 600;"> {point.ctd}</span></div>' +
            '<div style="font-size:11px; font-weight:400; margin-top:4px">(Click to see shipments)</div>',
          // + '{point.html_ctd}'
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
                      id: x?.label,
                      index: i,
                    };
                  });

                  if(mode == "origin"){
                    window.location.href="/pds/chart/shipment?mode=origin&id="+group_filter+"&value="+data[index]?.id+"&group="+group;
                  }else if(mode == "country"){
                    window.location.href="/pds/chart/shipment?mode=country&id="+group_filter+"&value="+data[index]?.id+"&group="+group;
                  }else if(mode == "comodity"){
                    window.location.href="/pds/chart/shipment?mode=comodity&id="+filters_value+"&country_id="+group_filter+"&value="+data[index]?.id+"&group="+group;
                  }
                  
                },
              },
            },
            name: title,
            // ${
            //   dateStart === "" || dateEnd === ""
            //     ? ""
            //     : `from ${new Date(dateStart).toLocaleDateString("en-en", {
            //         // weekday: "long",
            //         year: "numeric",
            //         month: "long",
            //         day: "numeric",
            //       })} to ${new Date(dateEnd).toLocaleDateString("en-en", {
            //         // weekday: "long",
            //         year: "numeric",
            //         month: "long",
            //         day: "numeric",
            //       })}`
            // }`,
            // color: "#2065D1",
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
                numberWithCommas(data?.cw),
                numberWithCommas(data?.cbm),
                data?.gw,
                data?.teus,
                data?.ctd,
                // (((data?.ctd ?? "")!=="")?'<div><div style="color:{series.color};">CTD :<span style="color: darkcyan; font-weight: 600;"> '+(data?.ctd ?? "0")+' </span></div>': '')
              ];
            }),
            keys: [
              "y",
              "cw",
              "cbm",
              "gw",
              "teus",
              "ctd",
              // "html_ctd"
            ],
            dataLabels: {
              enabled: true, // show data diatas grafik
              color: "#000000",
              align: "right",
              x: 5,
              y: 5,
              style: {
                font: "normal Verdana, sans-serif",
                fontSize: "11px",
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
      Highcharts.chart('chart-detail', optionsBar);
   
}