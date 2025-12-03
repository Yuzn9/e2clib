// Définir les variables - récup les éléments html nécessaire 
const connectButton = document.querySelector("#connect-button");
const main = document.querySelector("main");
const connectBox = document.querySelector("#connect-background");
const closeButton = document.querySelector(".close-button");
const formBox = document.querySelector("#connect-form");
let count = 0;

// Définir les fonctions - les différentes actions possibles 
function addText() {
    count ++;
    let newText = document.createElement("p");
    newText.classList.add("js-zone")
    if(count%2==0) {
        newText.style.color = "red"    
    }

    if(count <= 10) {
        newText.innerHTML = `Tentative de connexion n°${count}`
    } else {
        newText.innerHTML = "T'as pas compris que ça marchait pas ?"
        connectButton.removeEventListener("click", addText);
    }
    main.appendChild(newText)
}

function openConnect() {
    connectBox.style.display = "flex"
    connectBox.style.opacity = "1"
}

function closeConnect() {
    connectBox.style.display = "none"
    connectBox.style.opacity = "0"
}

function noClose (event) {
    event.stopPropagation()
}

// mettre en place les déclencheurs - ce qui va déclencher les actions qu'on a définit ( écouteur d'évenement )
connectButton.addEventListener("click", openConnect);   
closeButton.addEventListener("click", closeConnect);
connectBox.addEventListener("click", closeConnect);
formBox.addEventListener("click", noClose);