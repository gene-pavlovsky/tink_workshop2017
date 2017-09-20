package;

import haxe.io.Bytes;
import tink.http.containers.*;
import tink.http.Request;
import tink.http.Response;
import tink.web.routing.*;

using tink.CoreApi;

class Server {
	static function main() {
		
		var root = new Root();
		var router = new Router<Root>(root);
		
		var container = new NodeContainer(8080);
		container.run(function(req) return router.route(Context.ofRequest(req)).recover(OutgoingResponse.reportError));
		
	}
}