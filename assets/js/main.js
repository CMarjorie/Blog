document.addEventListener("DOMContentLoaded", function() {
    const button = document.querySelector("#next");
    const posts = document.querySelector("#posts");
    let number = 5;

    function onClick() {
        fetch("api/"+number)
        .then(function(response) {
            return response.text()
        })
        .then(function(html){
            number+=5;
            posts.innerHTML+=html;
        })
    }

   button.addEventListener("click", onClick);

})