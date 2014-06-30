class JoinedSequence<Element>
        ([Element+] firstSeq, [Element+] secondSeq)
        extends Object()
        satisfies [Element+] {
    
    size => firstSeq.size + secondSeq.size;
    
    first => firstSeq.first;
    last => secondSeq.last;
    
    rest => firstSeq.rest.append(secondSeq);
    
    shared actual Element? getFromFirst(Integer index) {
        value cutover = firstSeq.size;
        if (index < cutover) {
            return firstSeq.getFromFirst(index);
        }
        else {
            return secondSeq.getFromFirst(index-cutover);
        }
    }
    
    shared actual [Element[], Element[]] slice(Integer index) {
        if (index==firstSeq.size) {
            return [firstSeq,secondSeq];
        }
        else {
            return super.slice(index);
        }
    }
    
    shared actual Element[] spanTo(Integer to) {
        if (to==firstSeq.size-1) {
            return firstSeq;
        }
        else {
            return super.spanTo(to);
        }
    }
    
    shared actual Element[] spanFrom(Integer from) {
        if (from==firstSeq.size) {
            return secondSeq;
        }
        else {
            return super.spanFrom(from);
        }
    }
    
    shared actual Element[] measure(Integer from, Integer length) {
        if (from==0 && length==firstSeq.size) {
            return firstSeq;
        }
        else if (from==firstSeq.size && length>=secondSeq.size) {
            return secondSeq;
        }
        else {
            return super.measure(from, length);
        }
    }
    
    shared actual Element[] span(Integer from, Integer to) {
        if (from<=0 && to==firstSeq.size-1) {
            return firstSeq;
        }
        else if (from==firstSeq.size && to>=size-1) {
            return secondSeq;
        }
        else {
            return super.span(from, to);
        }
    }
    
    iterator() => ChainedIterator(firstSeq,secondSeq);
    
}
