$(".password-eye").on("click", function () {
    if ($(this).hasClass("fa-eye")) {
        $(this).attr("class", "password-eye fa-regular fa-eye-slash");
        $(".see-password").attr("type", "text");
    } else {
        $(this).attr("class", "password-eye fa-regular fa-eye");
        $(".see-password").attr("type", "password");
    }
});

$(".btn-atlas-1").on("click", function () {
    let homeRegisEmail = $("#home-regis-email").val();
    let homeRegisFirstName = $("#home-regis-firstname").val();
    let homeRegisCity = $("#home-regis-city").val();

    localStorage.setItem("homeRegisEmail", homeRegisEmail);
    localStorage.setItem("homeRegisFirstName", homeRegisFirstName);
    localStorage.setItem("homeRegisCity", homeRegisCity);
});

const inputElements = [...document.querySelectorAll("input.code-input")];

inputElements.forEach((ele, index) => {
    ele.addEventListener("keydown", (e) => {
        // if the keycode is backspace & the current field is empty
        // focus the input before the current. Then the event happens
        // which will clear the "before" input box.
        if (e.keyCode === 8 && e.target.value === "")
            inputElements[index - 1].focus();
    });
    ele.addEventListener("input", (e) => {

        // take the first character of the input
        // this actually breaks if you input an emoji like 👨‍👩‍👧‍👦....
        // but I'm willing to overlook insane security code practices.
        const [first, ...rest] = e.target.value;
        e.target.value = first ?? ""; // first will be undefined when backspace was entered, so set the input to ""
        const lastInputBox = index === inputElements.length - 1;
        const didInsertContent = first !== undefined;
        if(!e.target.value == ""){
            if( inputElements[index + 1].value == ''){
                if (didInsertContent && !lastInputBox) {
                    // continue to input the rest of the string
                    inputElements[index + 1].focus();
                    inputElements[index + 1].value = rest.join("");
                    inputElements[index + 1].dispatchEvent(new Event("input"));
                }
            }
        }
        
        
    });
});

// mini example on how to pull the data on submit of the form
function onSubmit(e) {
    e.preventDefault();
    const code = inputElements.map(({ value }) => value).join('')
    console.log(code);
}
