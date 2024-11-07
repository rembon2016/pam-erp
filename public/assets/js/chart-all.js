$(".datepickerx").flatpickr({
  dateFormat: "Y-m-d",
});
$("#reset").on("click", function () {
  // Add your logic to reset or clear the form fields by class
  $(".datepickerx").val("");
  $(".form-control").val("-");
  // Add similar lines for other classes or elements

  // Optionally, you can perform additional actions or reset other elements
  console.log("Reset");
  return false;
});
$( "#viewAll" ).on( "click", async function() {
    $("#chart").toggle();
    $("#list").toggle();
    $("#chart-all").toggle();
    var button = $("#viewAll");
          if (button.text() === "View All") {
              button.text("Back");
              // Add your logic for the "Back" state here
          } else {
              button.text("View All");
              // Add your logic for the "View All" state here
          }
  });
  
  
  function chartAllData(data,type){
    const dynamicHeight = Math.max(900, data.length * 70);

  
    const seriesData = [
      {
        point: {
          events: {
            click: function (e) {
              const index = this.index;
              const data = data?.map((x, i) => conditionSeries(x, i));
  
  
            },
          },
        },
        name: `Data Chart ${type}`,
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
          let finalTextCapitalize;
          if (data?.countries?.country_name !== undefined) {
            finalTextCapitalize = textCapitalize(data?.countries.country_name);
          } else {
            finalTextCapitalize = textCapitalize(data?.country_name);
          }
          return [
            parseFloat(data?.value),
            numberWithCommas(data?.cw),
            numberWithCommas(data?.cbm.toFixed(0)),
            numberWithCommas(data?.gw),
            numberWithCommas(data?.teus),
            numberWithCommas(data?.ctd),
            finalTextCapitalize,
          ];
        }),
        keys: ["y", "cw", "cbm", "gw", "teus", "ctd", "country", "color"],
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
    ];
  
    const seriesData2 = [
      {
        point: {
          events: {
            click: function (e) {
              const index = this.index;
              const data = data?.map((x, i) => conditionSeries(x, i));
  
             
            },
          },
        },
        name: `Data Chart ${type}`,
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
          let finalTextCapitalize;
          if (data?.countries?.country_name !== undefined) {
            finalTextCapitalize = textCapitalize(data?.countries.country_name);
          } else {
            finalTextCapitalize = textCapitalize(data?.country_name);
          }
          return [
            parseFloat(data?.value_air),
            numberWithCommas(data?.cw_air),
            numberWithCommas(data?.cbm_air.toFixed(0)),
            numberWithCommas(data?.gw_air),
            numberWithCommas(data?.teus_air),
            numberWithCommas(data?.ctd_air),
            finalTextCapitalize,
          ];
        }),
        keys: ["y", "cw", "cbm", "gw", "teus", "ctd", "country", "color"],
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
    ];
  
    const conditionSeries = (x, i) => {
      if (type === "consignee" || type === "shipper") {
        return {
          id: x?.customer_id,
          name: x?.customer_name,
          index: i,
        };
      } else if (type === "origin") {
        return {
          id: x?.office_id,
          name: x?.office_name,
          index: i,
        };
      } else if (type === "destination") {
        return {
          id: x?.country_id,
          name: x?.country_name,
          index: i,
        };
      } else if (type === "shippingline") {
        return {
          id: x?.vendor_id,
          name: x?.vendor_name,
          index: i,
        };
      } else if (type === "salesoffice") {
        return {
          id: x?.sales_office,
          name: x?.sales_office_name,
          index: i,
        };
      } else if (type === "flightcarrier") {
        return {
          id: x?.carrier_id,
          name: x?.carrier_name,
          index: i,
        };
      } else if (type === "commodity") {
        return {
          id: x?.comodity_name,
          name: x?.comodity_name,
          index: i,
        };
      }
    };
  
    const chartCategories = (row) => {
      if (type === "consignee" || type === "shipper") {
        return [row?.customer_name];
      } else if (type === "origin") {
        return [row?.office_name];
      } else if (type === "destination") {
        return [row?.country_name];
      } else if (type === "shippingline") {
        return [row?.vendor_name];
      } else if (type === "salesoffice") {
        return [row?.sales_office_name];
      } else if (type === "flightcarrier") {
        return [row?.carrier_name];
      } else if (type === "commodity") {
        return [row?.comodity_name];
      }
    };
  
    const options = {
      chart: {
        events: {
          click: function (e) {
  
          },
        },
        backgroundColor: {
          linearGradient: [0, 300, 5000, 1000],
          stops: [
            [0, "rgb(255, 255, 255)"],
            [1, "lightblue"],
          ],
        },
        type: "bar",
        height: dynamicHeight,
        scrollbar: {
          enabled: true,
        },
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
          pointPadding: 1, //width column
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
        bar: {
          pointWidth: 20, // Adjust the width of each bar
          minPointLength: 0.5, // Set a minimum height for each bar
          pointPadding: 0.5, // Adjust the space between bars
          groupPadding: 0.9, // Adjust the space between groups of bars
        },
      },
      xAxis: {
        labels: {
          enabled: true, // show label bawah
          events: {
            allowOverlap: true,
          },
        },
        categories: data?.map((row, i) => chartCategories(row)),
        crosshair: true, // shadow di belakang ketika hover chart
      },
      yAxis: {
        gridLineColor: "rgb(192,192,192, 0.2)",
        // gridLineWidth: 1,
        title: {
          text: "Chargeable weight", // show label samping
        },
        min: 0, //minimal dari 0
      },
  
      tooltip: {
        headerFormat: `
            ${
              type !== "destination"
                ? `<div style="font-size:10px; background: rgba(0,0,0,0.1); padding:4px 10px; display: flex; justify-content: center; border-radius:20px;">
                  <i style="margin-right:5px;" class="fas fa-dolly-flatbed"></i>{point.key}
                </div>`
                : `<div style="font-size:10px; background: rgba(0,0,0,0.1); padding:4px 10px; display: flex;      justify-content: center; align-items:center; border-radius:20px; text-transform:uppercase;">
                  <img src="/assets/img/countryuppercase/{point.x}.svg" alt="flag" width="18" height="18" style="margin-right:5px;"/>{point.x}</div>
                <div>`
            }
          `,
        pointFormat: `
          ${
            type === "shipper"
              ? `<div>
                  <div style="color:{series.color};">
                    Chargeable weight {point.series.name} :
                    <span style="color: darkcyan; font-weight: 600;"> 
                      {point.cw}
                    </span>
                  </div> 
                <div>
                <div style="color:{series.color};">
                  DOC :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.ctd}
                  </span>
                </div>
                <div style="color:{series.color};">
                  Country :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.country}
                  </span>
                </div>`
              : ""
          }
          ${
            type === "consignee"
              ? `<div>
                  <div style="color:{series.color};">
                    Chargeable weight {point.series.name} :
                    <span style="color: darkcyan; font-weight: 600;"> 
                      {point.cw} 
                    </span>
                  </div> 
                <div>
                <div style="color:{series.color};">
                  Country :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.country}
                  </span>
                </div>`
              : ""
          }
          ${
            type === "origin"
              ? `<div>
                  <div style="color:{series.color};">
                    Chargeable weight {point.series.name} :
                    <span style="color: darkcyan; font-weight: 600;"> 
                      {point.cw}
                    </span>
                  </div> 
                <div>
                <div style="color:{series.color};">
                  TEU :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.teus}
                  </span>
                </div>
                <div style="color:{series.color};">
                  DOC :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.ctd}
                  </span>
                </div>
                <div style="color:{series.color};">
                  Country :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.country}
                  </span>
                </div>`
              : ""
          }
          ${
            type === "destination"
              ? `<div style="color:{series.color};">
                  Country :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.country}
                  </span>
                </div>`
              : ""
          }
          ${
            type === "shippingline"
              ? `<div style="color:{series.color};">
                  TEU :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.teus}
                  </span>
                </div>
                <div>
                  <div style="color:{series.color};">
                    Chargeable weight {point.series.name} :
                    <span style="color: darkcyan; font-weight: 600;"> 
                      {point.cw}
                    </span>
                  </div> 
                <div>`
              : ""
          }
          ${
            type === "salesoffice"
              ? `<div>
                  <div style="color:{series.color};">
                    Chargeable weight {point.series.name} :
                    <span style="color: darkcyan; font-weight: 600;"> 
                      {point.cw}
                    </span>
                  </div> 
                <div>
                <div style="color:{series.color};">
                  DOC :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.ctd}
                  </span>
                </div>`
              : ""
          }
          ${
            type === "shippingline"
              ? `<div style="color:{series.color};">
                  TEU :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.teus}
                  </span>
                </div>
                <div>
                  <div style="color:{series.color};">
                    Chargeable weight {point.series.name} :
                    <span style="color: darkcyan; font-weight: 600;"> 
                      {point.cw}
                    </span>
                  </div> 
                <div>`
              : ""
          }
          ${
            type === "flightcarrier" || type === "commodity"
              ? `<div>
                  <div style="color:{series.color};">
                    Chargeable weight {point.series.name} :
                    <span style="color: darkcyan; font-weight: 600;"> 
                      {point.cw}
                    </span>
                  </div> 
                <div>
                <div style="color:{series.color};">
                  Gross-Weight :
                  <span style="color: darkcyan; font-weight: 600;"> 
                    {point.gw}
                  </span>
                </div>`
              : ""
          }
          <div style="font-size:11px; font-weight:400; margin-top:4px">(Click to see shipments)</div>
        `,
        footerFormat: "</div>",
        shared: true,
        useHTML: true,
      },
      series: [
        {
          name: "SEA AIR",
          color: "blue", // specify color for the first series
          data: seriesData[0].data,
          keys: seriesData[0].keys,
        },
        {
          name: "CROSS AIR",
          color: "red", // specify color for the second series
          data: seriesData2[0].data,
          keys: seriesData2[0].keys,
        },
        // Add more series if needed
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
  
    Highcharts.chart('chart-data-all', options);
  
  }