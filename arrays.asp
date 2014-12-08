<%
//////////////////////////////////////////////////////////////////////
//
// Arrays v1.4
//
// Arrays and hashes
//
// File    : arrays.asp
// Version : 1.4
// Source  : JScript
//
// Include this file only one time!
//
// Igor Salnikov aka SunDoctor, Copyright(C)
//
// Error found? Nothing is perfect...
//
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// #function Array arrayPush(Array a, Any value)
//      Put element to the tail
// #param Array a
//      Simple array
// #param Any value
//      Any value to put
// #return Array
//      Liniar array with new value
//////////////////////////////////////////////////////////////////////
function arrayPush(a,value) {
    a[a.length] = value;
}

//////////////////////////////////////////////////////////////////////
// #function Any arrayPop(Array a)
//      Extract last value from an array
// #param Array a
//      Liniar array
// #return Any
//      The last element of the array or  null, if empty
//////////////////////////////////////////////////////////////////////
function arrayPop(a) {
    if (a.length>0) {
        var result = a[a.length-1];
        delete a[a.length-1];
        a.length--;
        return result;
    }
    return null;
}

//////////////////////////////////////////////////////////////////////
// #function Boolean inArray(Array a, Any value)
//      Check value in array
// #param Array a
//      Linear array
// #param Any value
//      Value to search in
// #return Boolean
//      true/false
//////////////////////////////////////////////////////////////////////
function inArray(a,value) {
    for(var i=0;i<a.length;i++)
        if (a[i]==value)
            return true;
    return false;
}

//////////////////////////////////////////////////////////////////////
// #function Any arrayMax(Array a)
//      Fetch max value from an array
// #param Array a
//      Linear array
// #return Any
//      Max digit, max string or null, if empty
//////////////////////////////////////////////////////////////////////
function arrayMax(a) {
    if (a.length>0) {
        var v = a[0];
        for(var i=0;i<a.length;i++)
            if (a[i]>v) v = a[i];
        return v;
    }
    return null;
}

//////////////////////////////////////////////////////////////////////
// #function Any arrayMin(Array a)
//      Fetch min value from an array
// #param
//      Linear array
// #return Any
//      Min digit, min string or null, if empty
//////////////////////////////////////////////////////////////////////
function arrayMin(a) {
    if (a.length>0) {
        var v = a[0];
        for(var i=0;i<a.length;i++)
            if (a[i]<v) v = a[i];
        return v;
    }
    return null;
}

//////////////////////////////////////////////////////////////////////
// #function Array arrayLowerCase(Array a)
//      Lowercase letters from UPPERCASE
// #param Array a
//      Linear array of strings
// #return Array
//      Linear array of strings
//////////////////////////////////////////////////////////////////////
function arrayLowerCase(arr) {
    var result = [];
    for(var i=0;i<arr.length;i++)
        if (typeof(arr[i])=="string")
            arrayPush(result,arr[i].toLowerCase());
        else
            arrayPush(result,arr[i]);
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function Array arrayUpperCase(Array a)
//      UPPERCASE letters from lowercase
// #param Array a
//      Linear array of strings
// #return Array
//      Linear array of strings
//////////////////////////////////////////////////////////////////////
function arrayUpperCase(arr) {
    var result = [];
    for(var i=0;i<arr.length;i++)
        if (typeof(arr[i])=="string")
            arrayPush(result,arr[i].toUpperCase());
        else
            arrayPush(result,arr[i]);
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function Array arrayConcat(Array a1, Array a2)
//      Union of two arrays
// #param Array a1
//      Linear array 1
// #param Array a2
//      Linear array 2
// #return Array
//      Linear array 1 appended with array 2
//////////////////////////////////////////////////////////////////////
function arrayConcat(arr1,arr2) {
    var result = [];
    for(var i=0;i<arr1.length;i++)
        arrayPush(result,arr1[i]);
    for(var i=0;i<arr2.length;i++)
        arrayPush(result,arr2[i]);
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function Array arrayConcatUnique(Array a1, Array a2)
//      Unique Union of two arrays
// #param Array a1
//      Linear array 1
// #param Array a1
//      Linear array 2
// #return Array
//      Linear array 1 appended with array 2 with only unique elements
//////////////////////////////////////////////////////////////////////
function arrayConcatUnique(arr1,arr2) {
    var result = [];
    for(var i=0;i<arr1.length;i++)
        arrayPush(result,arr1[i]);
    for(var i=0;i<arr2.length;i++)
        if (!inArray(result,arr2[i]))
            arrayPush(result,arr2[i]);
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function Array arrayKeys(Hash h)
//      Get hash keys
// #param Hash h
//      Hash-array
// #return Array
//      Linear array with keys from input hash
//////////////////////////////////////////////////////////////////////
function arrayKeys(hash) {
    var result = [];
    for(var key in hash)
        result[result.length] = key;
    return result;
}

//////////////////////////////////////////////////////////////////////
// #fucntion Array arrayValues(Hash h)
//      Get hash values
// #param Hash h
//      Hash-array
// #return Array
//      Linear array with values from input hash
//////////////////////////////////////////////////////////////////////
function arrayValues(hash) {
    var result = [];
    for(var key in hash)
        result[result.length] = hash[key];
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function Hash hashInsert(Hash h, Any beforeKey, Array value)
//      Insert value in hash-array
// #param Hash h
//      Hash-array
// #param Any beforeKey
//      Hash key to insert BEFORE it
// #param Array value
//      Hash pair to insert [key, value]
// #return Hash
//      Hash-array with new pair
// #example
//      hash = hashInsert(hash, "key3",["key10","test"]);
//////////////////////////////////////////////////////////////////////
function hashInsert(arr,beforeKey,value) {
    var newArr = {};
    var flag = false;
    for(var k in arr) {
        if (k==beforeKey) {
            newArr[value[0]] = value[1];
            newArr[k]=arr[k];
            flag = true;
        } else
            newArr[k]=arr[k];
    }
    if (flag==false)
        newArr[value[0]] = value[1];
    return newArr;
}

//////////////////////////////////////////////////////////////////////
// #function Array hashGetFirst(Hash h)
//      Get first hash pair from Hash
// #param Hash h
//      Hash-array
// #return Array
//      Hash pair [key, value] or empty []
//////////////////////////////////////////////////////////////////////
function hashGetFirst(hash) {
    var result = [];
    for(var key in hash) {
        result[0] = key;
        result[1] = hash[key];
        return result;
    }
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function Array hashGetLast(Hash h)
//      Get last pair from Hash
// #param Hash h
//      Hash-array
// #return Array
//      Hash pair [key, value] or empty []
//////////////////////////////////////////////////////////////////////
function hashGetLast(hash) {
    var result = [];
    for(var key in hash) {
        result[0] = key;
        result[1] = hash[key];
    }
    return result;
}

//////////////////////////////////////////////////////////////////////
// #function Integer hashSize(Hash h)
//      Get hash size
// #param Hash h
//      Hash-array
// #return Integer
//      Count of pairs in Hash
//////////////////////////////////////////////////////////////////////
function hashSize(hash) {
    var count = 0;
    for(var key in hash) count++;
    return count;
}

//////////////////////////////////////////////////////////////////////
// #function Hash hashInvert(Hash h)
//      Invert keys with values in hash
// #param Hash h
//      Hash-array
// #return Hash
//      Hash-array with inverted key <=> value
//////////////////////////////////////////////////////////////////////
function hashInvert(hash) {
    var result = {};
    for(var key in hash)
        result[hash[key]] = key;
    return result;
}

%>
