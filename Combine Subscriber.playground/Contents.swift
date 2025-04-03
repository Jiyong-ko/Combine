import Combine
import PlaygroundSupport

// Playground가 비동기 코드를 실행할 수 있도록 설정
PlaygroundPage.current.needsIndefiniteExecution = true

// ===== 예제 1: sink Subscriber - 기본형 =====
print("\n1. sink Subscriber - 기본형")
print("---------------------------")

let numbersPublisher = [10, 20, 30, 40, 50].publisher

// sink는 가장 기본적인 Subscriber
// 값을 받아서 클로저 내에서 처리합니다
let basicSink = numbersPublisher.sink { number in
    print("-> 기본 sink로 받은 값: \(number)")
}

basicSink.cancel() // sink는 사용 후 cancel 해줘야 합니다.

// ===== 예제 2: sink Subscriber - 완료 처리 추가 =====
print("\n2. sink Subscriber - 완료 이벤트 처리")
print("-----------------------------------")

// 완료 이벤트도 처리하는 sink
let completionSink = numbersPublisher.sink(
    receiveCompletion: { completion in
        switch completion {
        case .finished:
            print("-> 모든 값 수신 완료!")
        case .failure(let error):
            print("-> 오류 발생: \(error)")
        }
    },
    receiveValue: { number in
        print("-> 값 수신: \(number)")
    }
)
