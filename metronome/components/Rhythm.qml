import QtQuick 2.4

ListModel {

    ListElement {
        name: "Quarter"
        number: 1 //number of beats in the measure
        tempoDiv: 1 //number to divide by to calc tempo
        pattern: ""
        silentPattern: ""
        img: "quarter.svg"
    }
    ListElement {
        name: "Eighth"
        number: 2
        tempoDiv: 2
        pattern: ""
        silentPattern: ""
        img: "eighth.svg"
    }
    ListElement {
        name: "Triplet"
        number: 3
        tempoDiv: 3
        pattern: ""
        silentPattern: ""
        img: "triplet.svg"
    }
    ListElement {
        name: "Triplet (Fall)"
        number: 3
        tempoDiv: 3
        pattern: ""
        silentPattern: "1"
        img: "fallTriplet.svg"
    }
    ListElement {
        name: "Triplet (Rise)"
        number: 3
        tempoDiv: 3
        pattern: ""
        silentPattern: "2"
        img: "riseTriplet.svg"
    }

    ListElement {
        name: "Sixteenth"
        number: 4
        tempoDiv: 4
        pattern: ""
        silentPattern: ""
        img: "sixteenth.svg"
    }
    ListElement {
        name: "Sixteenth (And A)"
        number: 4
        tempoDiv: 4
        pattern: ""
        silentPattern: "1"
        img: "sixteenthAndA.svg"
    }
    ListElement {
        name: "Dotted Eighth"
        number: 4
        tempoDiv: 4
        pattern: ""
        silentPattern: "12"
        img: "dottedEighth.svg"
    }

    ListElement {
        name: "Dotted Eighth (Rise)"
        number: 4
        tempoDiv: 4
        pattern: ""
        silentPattern: "23"
        img: "dottedEighthRise.svg"
    }
    ListElement {
        name: "Sixteenth (E And)"
        number: 4
        tempoDiv: 4
        pattern: ""
        silentPattern: "3"
        img: "sixteenthEAnd.svg"
    }
    ListElement {
        name: "Sixteenth (E A)"
        number: 4
        tempoDiv: 4
        pattern: ""
        silentPattern: "2"
        img: "sixteenthEA.svg"
    }
    ListElement {
        name: "Sixtuplet"
        number: 6
        tempoDiv: 6
        pattern: ""
        silentPattern: ""
        img: "sixtuplet.svg"
    }
    ListElement {
        name: "2/4 Quarter"
        number: 2
        tempoDiv: 1
        pattern: ""
        silentPattern: ""
        img: "24quarter.svg"
    }
    ListElement {
        name: "3/4 Quarter"
        number: 3
        tempoDiv: 1
        pattern: ""
        silentPattern: ""
        img: "34quarter.svg"
    }
    ListElement {
        name: "4/4 Quarter"
        number: 4
        tempoDiv: 1
        pattern: ""
        silentPattern: ""
        img: "44quarter.svg"
    }
    ListElement {
        name: "5/4 Quarter"
        number: 5
        tempoDiv: 1
        pattern: ""
        silentPattern: ""
        img: "54quarter.svg"
    }
    ListElement {
        name: "2/2 Cut Time"
        number: 2
        tempoDiv: 1
        pattern: ""
        silentPattern: ""
        img: "cutTime.svg"
    }
    ListElement {
        name: "5/8 (3-2)"
        number: 5
        tempoDiv: 2
        pattern: "3"
        silentPattern: ""
        img: "32.svg"
    }
    ListElement {
        name: "5/8 (2-3)"
        number: 5
        tempoDiv: 2
        pattern: "2"
        silentPattern: ""
        img: "23.svg"
    }
    ListElement {
        name: "7/8 (3-2-2)"
        number: 7
        tempoDiv: 2
        pattern: "35"
        silentPattern: ""
        img: "322.svg"
    }
    ListElement {
        name: "7/8 (2-3-2)"
        number: 7
        tempoDiv: 2
        pattern: "25"
        silentPattern: ""
        img: "232.svg"
    }
    ListElement {
        name: "7/8 (2-2-3)"
        number: 7
        tempoDiv: 2
        pattern: "24"
        silentPattern: ""
        img: "223.svg"
    }
    ListElement {
        name: "8/8 (3-3-2)"
        number: 8
        tempoDiv: 2
        pattern: "36"
        silentPattern: ""
        img: "332.svg"
    }
    ListElement {
        name: "8/8 (3-2-3)"
        number: 8
        tempoDiv: 2
        pattern: "35"
        silentPattern: ""
        img: "323.svg"
    }
    ListElement {
        name: "8/8 (2-3-3)"
        number: 8
        tempoDiv: 2
        pattern: "25"
        silentPattern: ""
        img: "233.svg"
    }
}
