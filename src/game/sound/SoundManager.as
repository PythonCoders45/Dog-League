package game.sound {
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.utils.Dictionary;

    public class SoundManager {
        private static var sounds:Dictionary = new Dictionary();
        private static var channels:Array = [];
        private static var volume:Number = 1.0;
        private static var muted:Boolean = false;

        public static function play(path:String, loop:Boolean = false):void {
            var snd:Sound;

            if (sounds[path]) {
                snd = sounds[path];
            } else {
                snd = new Sound(new URLRequest(path));
                sounds[path] = snd;
            }

            var channel:SoundChannel = snd.play(0, loop ? int.MAX_VALUE : 0, new SoundTransform(muted ? 0 : volume));
            var wrapper:SoundChannelWrapper = new SoundChannelWrapper(channel, path, loop);
            channels.push(wrapper);
        }

        public static function stopAll():void {
            for each (var w:SoundChannelWrapper in channels) {
                w.channel.stop();
            }
            channels = [];
        }

        public static function setVolume(v:Number):void {
            volume = v;
            updateVolume();
        }

        public static function mute():void {
            muted = true;
            updateVolume();
        }

        public static function unmute():void {
            muted = false;
            updateVolume();
        }

        private static function updateVolume():void {
            for each (var w:SoundChannelWrapper in channels) {
                w.channel.soundTransform = new SoundTransform(muted ? 0 : volume);
            }
        }
    }
}
