$(document).ready(function (){
    const _token = $("meta[name=csrf-token]").attr("content");
    const _inputCsrfToken = `<input type="hidden" name="_token" value="${_token}">`;

    // Dynamic Modal
    const defaultModal = `
    <div class="modal fade" id="defaultModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" id="dialog-box" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="defaultModalTitle">Modal Title</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
          </div>
        </div>
    </div>`;

    // Show Confirm Modal
    const deleteConfirmHtml = `
    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal modal-dialog-centered" id="dialog-box" role="document">
            <div class="modal-content">
                <div class="modal-body text-center d-flex flex-column align-items-center justify-content-center" style="gap: 15px;">
                    <i class='bx bx-message-alt-error text-danger mt-3' style="font-size: 90px !important;"></i>
                    <h2 class="mb-0">Apakah anda yakin?</h2>
                    <p class="mb-0">Data yang sudah dihapus tidak dapat dipulihkan kembali. Apakah anda ingin melanjutkan?</p>
                </div>
                <div class="modal-footer d-flex align-items-center justify-content-center">
                    <form id="delete-form" class="d-flex align-items-center justify-content-center" style="gap: 10px;" method="POST">
                        <input type="hidden" name="_method" value="DELETE">
                        ${_inputCsrfToken}
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        Tidak
                        </button>
                        <button type="submit" class="btn btn-danger">Ya</button>
                    </form>
                </div>
            </div>
        </div>
    </div>`;

    // Show Confirm Modal
    const confirmHtml = `
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal modal-dialog-centered" id="dialog-box" role="document">
            <div class="modal-content">
                <div class="modal-body text-center d-flex flex-column align-items-center justify-content-center" style="gap: 15px;">
                    <i class='bx bx-message-alt-error text-danger mt-3' style="font-size: 90px !important;"></i>
                    <h2 class="mb-0">Apakah anda yakin?</h2>
                    <p class="mb-0">Data yang sudah diproses tidak dapat diperbarui. Apakah anda ingin melanjutkan?</p>
                </div>
                <div class="modal-footer d-flex align-items-center justify-content-center">
                    <form id="confirm-form" class="d-flex align-items-center justify-content-center" style="gap: 10px;" method="POST">
                        ${_inputCsrfToken}
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        Tidak
                        </button>
                        <button type="submit" class="btn btn-danger">Ya</button>
                    </form>
                </div>
            </div>
        </div>
    </div>`;

    $("body").append(defaultModal);
    $("body").append(deleteConfirmHtml);
    $("body").append(confirmHtml);

    const myModal = document.getElementById("defaultModal");

    // Remove Modal Body and Footer when Closed
    myModal.addEventListener("hidden.bs.modal", (event) => {
        $("#defaultModal .modal-body, #defaultModal .modal-footer").remove();
        $("#defaultModal #dialog-box").removeAttr("class");
        $("#defaultModal #dialog-box").attr(
            "class",
            "modal-dialog modal-lg modal-dialog-centered"
        );
    });

    $(document)
        .off("click", "[data-type='modal']")
        .on("click", "[data-type='modal']", (event) => {
            event.preventDefault();

            const sizeModal =
                event.target.getAttribute("data-size-modal") ?? "lg";
            const modalType = ["sm", "lg", "xl"];
            const sizeClassModal =
                sizeModal == "" || !modalType.includes(sizeModal)
                    ? "modal-lg"
                    : `modal-${sizeModal}`;
            const modalDialog = myModal.querySelector("#dialog-box");

            // Change Modal Size
            modalDialog.classList.remove("modal-lg");
            modalDialog.classList.add(sizeClassModal);

            // Change Modal Title
            const modalTitle =
                event.target.getAttribute("data-modal-title") ?? "Modal Title";
            myModal.querySelector("#defaultModalTitle").innerText = modalTitle;

            // Render Dynamic Modal
            $.ajax({
                method: "GET",
                url: event.target.getAttribute("href"),
                success: function (data) {
                    $("#defaultModal .modal-content").append(data);
                },
                error: function (error) {
                    console.error("Error: ", error);
                },
            }).then(() => {
                $("#defaultModal").modal("show");
            });
        });

    const deleteConfirmModal = document.getElementById("deleteConfirmModal");

    $(document)
        .off("click", ".delete-confirm")
        .on("click", ".delete-confirm", (event) => {
            event.preventDefault();

            const setContentPromise = new Promise((resolve, reject) => {
                try {
                    const deleteForm =
                        deleteConfirmModal.querySelector("#delete-form");
                    deleteForm.setAttribute(
                        "action",
                        event.target.getAttribute("href")
                    );
                    resolve(deleteConfirmModal);
                } catch (error) {
                    reject(error);
                }
            });

            setContentPromise
                .then((modal) => {
                    $(modal).modal("show");
                })
                .catch((error) => {
                    console.error("Error: ", error);
                });
        });

    const confirmModal = document.getElementById("confirmModal");

    $(document)
        .off("click", ".post-confirm")
        .on("click", ".post-confirm", (event) => {
            event.preventDefault();

            const setContentPromise = new Promise((resolve, reject) => {
                try {
                    const confirmForm =
                        confirmModal.querySelector("#confirm-form");
                    confirmForm.setAttribute(
                        "action",
                        event.target.getAttribute("href")
                    );
                    resolve(confirmModal);
                } catch (error) {
                    reject(error);
                }
            });

            setContentPromise
                .then((modal) => {
                    $(modal).modal("show");
                })
                .catch((error) => {
                    console.error("Error: ", error);
                });
        });

    $(".modal [data-bs-dismiss='modal']")
        .off("click")
        .on("click", (event) => {
            event.preventDefault();
            $(event.target).parents(".modal").modal("hide");
        });

    // Remove Modal Body and Footer when Closed
    deleteConfirmModal.addEventListener("hidden.bs.modal", (event) => {
        const deleteForm = deleteConfirmModal.querySelector("#delete-form");
        deleteForm.removeAttribute("action");
    });

    $(document)
        .off('click', 'a[data-type="confirm"]')
        .on('click', 'a[data-type="confirm"]', function(event) {
            event.preventDefault();
            const urlToRedirect = event.currentTarget.getAttribute('href'); //use currentTarget because the click may be on the nested i tag and not a tag causing the href to be empty

            Swal.fire({
                title: 'Are you sure you want to delete this item?',
                showCancelButton: true,
                confirmButtonText: 'Ya',
                cancelButtonText: 'Tidak',
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    window.location.href = urlToRedirect;
                }
            }) // verify if this is the right URL
        })
});