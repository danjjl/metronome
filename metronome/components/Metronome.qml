import QtQuick 2.4
import QtMultimedia 5.4
import Metronome 1.0

Item {
	property var tempo: 60.0

	function play() {
		metronomeLine.rotation = 300
		rotateAnimation.start()
		soundBeat.play()

	}

	function stop() {
		rotateAnimation.stop()
		soundBeat.stop()

	}

	function playStop() {
		if(rotateAnimation.running)
			stop()
		else
			play()
	}

	function updateTempo(nTempo)
	{
		tempo = nTempo
		makeBeat.makeBeat(tempo)
        soundBeat.source = "/home/phablet/.local/share/metronome.danjjl/beat.wav"
		rotateRight.duration = 1000.0*60.0/tempo
		rotateLeft.duration = 1000.0*60.0/tempo
		playStop(); playStop()
	}

    Metronome {
		id: makeBeat
	}

	Audio {
		id: soundBeat
        source: "beat.wav"
		loops: SoundEffect.Infinite
	}

	Rectangle {
		id: metronomeLine

		property var angle: 300

		color: "black"
		width: units.gu(1)
		height: units.gu(20)
		
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.bottom: parent.bottom

		transformOrigin: Item.Bottom
		rotation: 300
		smooth: true

		SequentialAnimation {
			id: rotateAnimation
			loops: Animation.Infinite

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

	anchors {
		horizontalCenter: parent.horizontalCenter
		bottom: parent.bottom
	}

}
