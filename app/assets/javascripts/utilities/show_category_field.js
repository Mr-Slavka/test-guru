
document.addEventListener('turbolinks:load', function() {
    let control = document.getElementById('badge_rule');

    if (control) { control.addEventListener('input', showCategory); }
})

function showCategory() {
    let rule = document.getElementById('badge_rule').value;
    let categoryField = document.querySelector('.category');
    if (rule === 'all_tests_from_category') {
        categoryField.classList.remove('hide');
    } else {
        categoryField.classList.add('hide');
    }
}