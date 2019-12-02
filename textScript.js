const texts = ["TheBestRates", "Membershipdiscounts", "ExclelentFlightServices"]; //global variables
let count = 0;
let index = 0;
let currentText = "";
let letter = "";

(function type() {

    if (count === texts.length) {
        count = 0;
    }
    currentText = texts[count];
    letter = currentText.slice(1, ++index);

    document.querySelector("Typing").textContent = letter;
    //each time it check the number it increments by one
    if (letter.length === currentText.length) {
        count++;
        index = 0;
    }
    setTimeout(type, 400);//the fourhundred is the miliseconds
})();

// /// <autosync enabled="true" />
//    const TypeWritter = function(txtElement, words, wait = 3000)
//    {
//    alert("why?");
//    this.txtElement = txtElement;
//    this.words = words;
//    this.txt = '';
//    this.WordIndex = 0;
//    this.wait = parseFloat(wait, 10);
//    this.type();
//    this.isDeleting = false;
//}
////type Method
//TypeWritter.prototype.type = function() {
//        //current index of word
//        const current = this.WordIndex % this.words.lenght;
//    // get full text of current word
//        const fullTxt = this.words[current];
//       //console.log(fullTxt);    
//    //check if deleting
//    if (this.isDeleting) {
//        this.txt = fullTxt.substring(0, this.txt.lenght - 1);

//    }
//                else {
//             this.txt = fullTxt.substring(0, this.txt.lenght + 1);
//    }
//    //insert into element
//                this.txtElement.innerHTML = `<span class="txt">${this.txt}</span>`;


//    setTimeout(() => this.type(), 500) // this sets a timer for each time an elemets stops
//}
////Init on domain Load
//document.addEventListener('DOMContentLoaded', init);
////init app
//            function init() {
//                const txtElement = document.querySelector('.TXT-Type');
//    const words = JSON.parse(txtElement.getAttribute('data-words'));
//    const wait = txtElement.getAttribute('data-wait');
//    // init typewritter
//    new TypeWritter(txtElement, words, wait);
//}