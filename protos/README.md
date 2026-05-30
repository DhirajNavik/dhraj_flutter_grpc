## GRPC

Why Protocol Buffer
    - Binary format
    - Smaller message
    - Faster Processing
    - Strong Schema

WorkFlow

    .Proto -> ProtoCompiler ->Generated code (Dart,Go,etc..)

Basic Example

syantax = "proto3"

package user;

["Message_here_is_a_data_structure"]

message User {
    string name = 1;
    int32 age =2;
    repeated string data = 3;
}

no -1,0 field number start from 1,2,3....

-> Data Types

string
int32
int64
bool
float
double
bytes

-> Array or list 

repeated String data = ["Go","Dart"]

-> Maps

map<string,int32> marks = 4

example : {"math":90,"english":50}

-> nested messaged

message User {
    message Address {
        string city = 1;
        string country = 2;
    }
    string name = 1;
    Address address = 2;
}

-> required / optional 

in proto3 fields are optional by default

-> reserved fields

message User{

    reserved 3;
    reserved "old_field";

}

- if want to remove some fields mark reserved for backward compatibility


