document.addEventListener('turbolinks:load', function() {
    let timer = document.querySelector('.timer');
    if (timer) { countdown(timer) }
});

function countdown(timer) {
    let startTime = Date.now();
    let endTime = startTime + (timer.dataset.time * 1000);
    let timeRemain = (endTime - startTime) / 1000;

    setInterval(function() {
        document.querySelector('.timer').textContent = 'Осталось ' + timeRemain + ' сек.';
        timeRemain -= 1;

        if (timeRemain < 0) {
            document.forms[0].submit()
        }
    }, 1000)
}
