package game.sound {
    import flash.media.SoundChannel;

    public class SoundChannelWrapper {
        public var channel:SoundChannel;
        public var loop:Boolean;
        public var path:String;

        public function SoundChannelWrapper(channel:SoundChannel, path:String, loop:Boolean) {
            this.channel = channel;
            this.loop = loop;
            this.path = path;
        }
    }
}
