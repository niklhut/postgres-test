import Vapor
import Fluent

final class MyModel: Fluent.Model {
    static var schema = "my_model"
    
    struct FieldKeys {
        struct v1 {
            static var myValue: FieldKey { "my_value" }
        }
    }
    
    @ID() var id: UUID?
    @Field(key: FieldKeys.v1.myValue) var myValue: String
    
    init() { }
    
    init(myValue: String) {
        self.myValue = myValue
    }
}

struct MyModelMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(MyModel.schema)
            .id()
            .field(MyModel.FieldKeys.v1.myValue, .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(MyModel.schema).delete()
    }
}
