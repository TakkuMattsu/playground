import UIKit
import RxSwift


let listObservable: Array<Observable<Int>> = [Observable.just(1), Observable.just(2)]
let observableFromList: Observable<Int> = Observable.concat(listObservable)
observableFromList.subscribe(onNext: {
    print($0)
})

let kadai: Observable<Array<Int>> = Observable.create { observer in
    observer.onNext([1,2,3])
    observer.onCompleted()
    return Disposables.create()
}
kadai.flatMap { (list: Array<Int>) -> Observable<Int> in
    let obs: Array<Observable<Int>> = list.map({ (v: Int) -> Observable<Int> in
        Observable.just(v)
    })
    return Observable.concat(obs)
    }.subscribe(onNext: {
        print("hello")
        print($0)
    })
