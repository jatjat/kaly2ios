ROOT_DIR=$(pwd)

PROTOS_DIR=Shared/Infrastructure/Protos
GENERATED_MODELS_DIR=Shared/Infrastructure/Generated/Models
GENERATED_GRPC_BINDINGS_DIR=Shared/Infrastructure/Generated/GRPC

mkdir -p $GENERATED_MODELS_DIR 
mkdir -p $GENERATED_GRPC_BINDINGS_DIR 

#protoc --plugin=protoc-gen-grpc-swift --swift_out=$GENERATED_MODELS_DIR --proto_path=. $PROTOS_DIR/*.proto
#protoc --plugin=protoc-gen-grpc-swift --swiftgrpc_out=$GENERATED_GRPC_BINDINGS_DIR $PROTOS_DIR/*.proto


cd $GENERATED_MODELS_DIR
protoc --swift_out=. --proto_path=$ROOT_DIR/$PROTOS_DIR $ROOT_DIR/$PROTOS_DIR/*.proto

cd $ROOT_DIR


cd $GENERATED_GRPC_BINDINGS_DIR
protoc --grpc-swift_out=Client=true,ExperimentalAsyncClient=true:. --proto_path=$ROOT_DIR/$PROTOS_DIR $ROOT_DIR/$PROTOS_DIR/*.proto
