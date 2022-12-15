//
//  WebSocketManager.swift
//  Sant Academy
//
//  Created by Letícia Victoria das Neves Sales on 14/12/22.
//

import Foundation

class WebSocketStream: AsyncSequence{
    
    typealias Element = URLSessionWebSocketTask.Message
    typealias AsyncIterator = AsyncThrowingStream<URLSessionWebSocketTask.Message, Error>.Iterator
    
    private var stream: AsyncThrowingStream<Element, Error>?
    private var continuation: AsyncThrowingStream<Element, Error>.Continuation?
    private let socket: URLSessionWebSocketTask
    
    init(url: String, session: URLSession = URLSession.shared) {
       
        socket = session.webSocketTask(with: URL(string: url)!)
        
        stream = AsyncThrowingStream { continuation in
            self.continuation = continuation
            self.continuation?.onTermination = { @Sendable [socket] _ in
                socket.cancel()
            }
        }
    }
    
    private func listenForMessages() {
        socket.receive { [unowned self] result in
            switch result {
            case .success(let message):
                continuation?.yield(message)
                listenForMessages()
            case .failure(let error):
                continuation?.finish(throwing: error)
            }
        }
    }
    
    func makeAsyncIterator() -> AsyncThrowingStream<URLSessionWebSocketTask.Message, Error>.Iterator {
        guard let  stream = stream else{
            fatalError("stream not initialized")
        }
        
        socket.resume()
        listenForMessages()
        return stream.makeAsyncIterator()
    }

}
