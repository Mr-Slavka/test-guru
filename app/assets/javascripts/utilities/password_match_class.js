class PasswordMatch {

    constructor (page) {
        this.page = page;
    }

    passwordsDefinition (password, password_confirmation) {
        let match = this.page.querySelector('.octicon-check');
        let noMatch = this.page.querySelector('.octicon-circle-slash');

        this.page.addEventListener('input', function () {
            if (password_confirmation.value !== '' ) {
                return checkConfirmation(password, password_confirmation);
            }
            else {    noMatch.classList.add('hide');
                      match.classList.add('hide');
            }
        })
        let checkConfirmation = (password, password_confirmation) => {
            if(password.value === password_confirmation.value) {
                match.classList.remove('hide');
                noMatch.classList.add('hide');
        }
            else { noMatch.classList.remove('hide');
                   match.classList.add('hide');
        }}
    }
}
