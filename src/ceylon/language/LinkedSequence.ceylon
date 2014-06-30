class LinkedSequence<Element>(first, rest)
        extends Object()
        satisfies Sequence<Element> {
    
    shared actual Element first;
    shared actual Element[] rest;
    
    size => rest.size+1;
    
    shared actual Element? getFromFirst(Integer index) {
        if (index==0) {
            return first;
        }
        else {
            return rest.getFromFirst(index-1);
        }
    }
    
    shared actual Element last {
        if (nonempty rest) {
            return rest.last;    
        }
        else {
            return first;
        }
    }
    
    shared actual Iterator<Element> iterator() {
        object iterator 
                satisfies Iterator<Element> {
            variable value start = true;
            variable value remaining = rest;
            variable Iterator<Element>? iter = null;
            shared actual Element|Finished next() {
                if (start) {
                    start = false;
                    return first;
                }
                else if (is LinkedSequence<Element> seq 
                            = remaining) {
                    value next = seq.first;
                    remaining = seq.rest;
                    return next;
                }
                else {
                    if (exists it=iter) {
                        return it.next();
                    }
                    else {
                        value it = remaining.iterator();
                        iter = it;
                        return it.next();
                    }
                }
            }
        }
        return iterator;
    }
}
