var inputs = document.querySelectorAll('input');

// events
for (var input of inputs ){
    input.onkeyup = function(e) {
        inputName = this.name;
        inputTab = this.getAttribute('data-tab');
        inputVal = this.value; // updates the variable on each ocurrence
        var content = this.parentElement.querySelector('.hugeList');
        content.innerHTML = '';
        if (inputVal.length > 0) {
            console.log('http://localhost/recette/admin/admin.php?action='+inputTab+'&nomTable='+inputTab+'&nomChamps='+inputName+'&search='+inputVal);
            fetch('http://localhost/recette/admin/admin.php?action='+inputTab+'&nomTable='+inputTab+'&nomChamps='+inputName+'&search='+inputVal)
            .then(function (response) {
                return response.json();
            }).then(function (liste) {
                console.log("deuxième then");
                autocomplete_results = document.getElementById("hugeList_"+inputName);
                for (i = 0; i < liste.length; i++) {
                    autocomplete_results_HTML = document.createElement('option');
                    autocomplete_results_HTML.innerText = liste[i];
                    autocomplete_results_HTML.addEventListener('click', function (e) {
                        e.preventDefault();
                        document.getElementById(inputName).value = this.label;
                    });
                    autocomplete_results.appendChild(autocomplete_results_HTML)
                }
                autocomplete_results.style.display = 'block';
            });
        }
    }
}