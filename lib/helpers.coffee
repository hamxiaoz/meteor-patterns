# _.mixin
#   "eachSlice": (obj, size, iterator, context)->
#     for (i=0, l=obj.length; i < l; i+=size)
#       iterator.call(context, obj.slice(i,i+size), i, obj)


# http://stackoverflow.com/questions/10249658
`
Array.prototype.eachSlice = function (size, callback){
  for (var i = 0, l = this.length; i < l; i += size){
    callback.call(this, this.slice(i, i + size));
  }
};
`
# string.startsWith and endsWith
# http://stackoverflow.com/a/646643/166286
# http://stackoverflow.com/a/2548133
`
if (typeof String.prototype.startsWith != 'function') {
  String.prototype.startsWith = function (str){
    return this.slice(0, str.length) == str;
  };
}
if (typeof String.prototype.endsWith != 'function') {
  String.prototype.endsWith = function (str){
    return this.slice(-str.length) == str;
  };
}
`

