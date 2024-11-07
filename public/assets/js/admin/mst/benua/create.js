"use strict";
var KTCareersApply = (function () {
    var t, e, i;
    return {
        init: function () {
            (i = document.querySelector("#kt_careers_form")),
                (t = document.getElementById("kt_careers_submit_button")),
                $(i.querySelector('[name="position"]')).on(
                    "change",
                    function () {
                        e.revalidateField("position");
                    }
                ),
                $(i.querySelector('[name="start_date"]')).flatpickr({
                    enableTime: !1,
                    dateFormat: "d, M Y",
                }),
                (e = FormValidation.formValidation(i, {
                    fields: {
                        nama: {
                            validators: {
                                notEmpty: { message: "Nama is required" },
                            },
                        },
                        alias: {
                            validators: {
                                notEmpty: { message: "Alias is required" },
                            },
                        },
                    },
                    plugins: {
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap: new FormValidation.plugins.Bootstrap5({
                            rowSelector: ".fv-row",
                            eleInvalidClass: "",
                            eleValidClass: "",
                        }),
                    },
                })),
                t.addEventListener("click", function (i) {
                    i.preventDefault(),
                        e &&
                            e.validate().then(function (e) {
                                console.log("validated!"),
                                    "Valid" == e
                                        ? (t.setAttribute(
                                              "data-kt-indicator",
                                              "on"
                                          ),
                                          (t.disabled = !0),
                                          setTimeout(function () {
                                              t.removeAttribute(
                                                  "data-kt-indicator"
                                              ),
                                                  (t.disabled = !1),
                                                  Swal.fire({
                                                      text: "Form has been successfully submitted!",
                                                      icon: "success",
                                                      buttonsStyling: !1,
                                                      confirmButtonText:
                                                          "Ok, got it!",
                                                      customClass: {
                                                          confirmButton:
                                                              "btn btn-primary",
                                                      },
                                                  }).then(function (t) {
                                                      t.isConfirmed;
                                                  });
                                          }, 2e3))
                                        : Swal.fire({
                                              text: "Sorry, looks like there are some errors detected, please try again.",
                                              icon: "error",
                                              buttonsStyling: !1,
                                              confirmButtonText: "Ok, got it!",
                                              customClass: {
                                                  confirmButton:
                                                      "btn btn-primary",
                                              },
                                          }).then(function (t) {
                                              KTUtil.scrollTop();
                                          });
                            });
                });
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    KTCareersApply.init();
});
