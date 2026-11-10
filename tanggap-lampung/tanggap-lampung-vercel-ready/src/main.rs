use axum::{routing::get, Router};
use std::net::SocketAddr;

mod config;
mod db;

#[tokio::main]
async fn main() {
    println!("Server Tanggap Lampung Berjalan...");
    let app = Router::new().route("/healthz", get(|| async { "OK" }));
    let addr = SocketAddr::from(([0, 0, 0, 0], 3000));
    axum::Server::bind(&addr).serve(app.into_make_service()).await.unwrap();
}
