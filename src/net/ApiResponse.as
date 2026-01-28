package net {
    public class ApiResponse {
        public var data:Object;

        public function ApiResponse(data:Object) {
            this.data = data;
        }

        public function ok():Boolean {
            return data && !data.error;
        }

        public function errorMessage():String {
            return data && data.error ? data.error : null;
        }
    }
}
