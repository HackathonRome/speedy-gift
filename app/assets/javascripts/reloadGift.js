        window.addEventListener('shake', shakeEventDidOccur, false);
        function shakeEventDidOccur ()
        {
                $('#overlay').fadeIn(300);
                window.location.reload()
        }
