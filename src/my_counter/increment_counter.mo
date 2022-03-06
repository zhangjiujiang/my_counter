// Create a simple Counter actor.
import Nat "mo:base/Nat";
import Text "mo:base/Text";
actor Counter {
    stable var currentValue : Nat = 0;

    // Increment the counter with the increment function.
    public func increment() : async () {
        currentValue += 1;
    };

    // Read the counter value with a get function.
    public query func get() : async Nat {
        currentValue
    };

    // Write an arbitrary value with a set function.
    public func set(n: Nat) : async () {
        currentValue := n;
    };

    type HttpRequest = {
    body: Blob;
    headers: [HeaderField];
    method: Text;
    url: Text;
    };

    type HeaderField = (Text, Text);

    type HttpResponse = {
        body: Blob;
        headers: [HeaderField];
        status_code: Nat16;
    };

    public query func http_request(request : HttpRequest) : async HttpResponse {
        {
            body = Text.encodeUtf8(Nat.toText(currentValue));
            headers = [("Content-Type","text/plain")];
            status_code = 200;
        }
    };
}