import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(.postgres(
        configuration: SQLPostgresConfiguration(
            hostname: Environment.dbHost,
            port: Environment.dbPort.flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
            username: Environment.pgUser,
            password: Environment.pgPassword,
            database: Environment.pgDbName,
            tls: .disable
        )
    ), as: .psql)

    
    app.migrations.add(MyModelMigration())
    
    // register routes
    try routes(app)
}
