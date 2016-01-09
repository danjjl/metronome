import QtQuick 2.4
import QtMultimedia 5.4
import Ubuntu.Components 1.3
import Metronome 1.0

Item {
    id: metronome

    property int tempo: 60
    property int rhythmIndex: 0
    property int main: 0; property int sub: 1; property int silent: 2; //enum
    property var beatPattern: [main]

    function play() {
        metronomeLine.rotation = 300
        timer.start()
        timer.running = true

    }

    function stop() {
        rotateLeft.stop(); rotateRight.stop()
        timer.stop()
        timer.index = 0
        timer.running = false

    }

    function playStop() {
        if(timer.running)
            stop()
        else
            play()
    }

    function updateTempo(nTempo) {
        tempo = nTempo
        timer.interval = 1000.0*60.0/(tempo*listRhythms.get(rhythmIndex).tempoDiv)
        rotateRight.duration = 1000.0*60.0/tempo
        rotateLeft.duration = 1000.0*60.0/tempo
        playStop(); playStop();
    }

    function updateRhythm(nRhythmIndex) {
        rhythmIndex = nRhythmIndex
        buildRhyhtmPattern()
        updateTempo(tempo)
    }

    function buildRhyhtmPattern() {
        //load pattern
        var mainBeat = listRhythms.get(rhythmIndex).pattern
        var silentBeat = listRhythms.get(rhythmIndex).silentPattern
        //Reinitialise
        var index
        beatPattern = []
        beatPattern[0] = main
        // insert sub beats
        for (var i = 1; i < listRhythms.get(rhythmIndex).number; i++) {
            beatPattern[i] = sub
        }
        // insert main beats
        for (i = 0; i < mainBeat.length; i++) {
            index = parseInt(pattern.charAt(i))
            beatPattern[index] = main
        }
        // insert silent beats
        for (i = 0; i < silentBeat.length; i++) {
            index = parseInt(silentBeat.charAt(i))
            beatPattern[index] = silent
        }
    }

    function playBeat() {
        if(timer.index == 0) {
            if(timer.dirRight) {
                rotateLeft.stop()
                rotateRight.start()
            }
            else {
                rotateRight.stop()
                rotateLeft.start()
            }
            timer.dirRight = !timer.dirRight
        }
        if(beatPattern[timer.index] === main)
            beat.play()
        else if (beatPattern[timer.index] === sub)
            subBeat.play()
        timer.index = (timer.index + 1) % listRhythms.get(rhythmIndex).number
    }

    anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
    StateSaver.properties: "tempo"

    Rhythm {
        id: listRhythms
    }

    Metronome {
        id: timer

        property bool running: false
        property int index: 0
        property bool dirRight: true

        interval: 1000.0*60.0/tempo
        singleShot: false
        onTimeout: playBeat()
    }

    SoundEffect {
        id: beat
        source: "beat.wav"
    }

    SoundEffect {
        id: subBeat
        source: "subBeat.wav"
    }

    Rectangle {
        id: metronomeLine

        property int angle: 300

        width: units.gu(1); height: units.gu(20)
        anchors { bottom: parent.bottom; horizontalCenter: parent.horizontalCenter }
        color: "black"
        transformOrigin: Item.Bottom
        rotation: 300
        smooth: true

        RotationAnimation {
            id: rotateRight
            target: metronomeLine
            duration: 1000.0*60.0/tempo
            direction: RotationAnimation.Clockwise
            to: 60
        }
        RotationAnimation {
            id: rotateLeft
            target: metronomeLine
            duration: 1000.0*60.0/tempo
            direction: RotationAnimation.Counterclockwise
            to: 300
        }
    }
}
