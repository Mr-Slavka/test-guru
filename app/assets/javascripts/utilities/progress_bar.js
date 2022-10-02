document.addEventListener('turbolinks:load', function () {
    const control = document.getElementById('progress-bar')

    if (control) {
        const questions = control.dataset.questions
        const current_question = control.dataset.currentQuestion - 1
        const width = current_question / questions * 100
        control.style.width = `${width}%`
    }
})