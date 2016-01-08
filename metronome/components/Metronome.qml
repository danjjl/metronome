import QtQuick 2.4
import QtMultimedia 5.4
import Metronome 1.0

Item {
    property int tempo: 60

	function play() {
		metronomeLine.rotation = 300
        timer.start();
        timer.running = true;

	}

	function stop() {
        rotateLeft.stop(); rotateRight.stop();
        timer.stop();
        timer.num = 0;
        timer.running = false;

	}

	function playStop() {
        if(timer.running)
            stop();
		else
            play();
	}

    function updateTempo(nTempo) {
        tempo = nTempo
        timer.interval = 1000.0*60.0/tempo;
        rotateRight.duration = 1000.0*60.0/tempo;
        rotateLeft.duration = 1000.0*60.0/tempo;
        playStop(); playStop();
	}

    function playBeat() {
        if(timer.num == 0){
            rotateLeft.stop();
            rotateRight.start();
        }
        else{
            rotateRight.stop();
            rotateLeft.start();
        }
        timer.num = ~timer.num;
        beat.play();

    }

    Metronome {
        id: timer
        interval: 1000.0*60.0/tempo;
        singleShot: false
        property bool running: false;
        property int num: 0

        onTimeout:{
            playBeat();
        }
	}

    SoundEffect {
        id: beat
        source: "beat.wav"
	}

	Rectangle {
		id: metronomeLine

        property int angle: 300

		color: "black"
		width: units.gu(1)
		height: units.gu(20)
		
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.bottom: parent.bottom

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

	anchors {
		horizontalCenter: parent.horizontalCenter
		bottom: parent.bottom
	}

}
