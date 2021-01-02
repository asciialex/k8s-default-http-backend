use warp::{http::StatusCode, Filter};

#[tokio::main]
async fn main() {

    let root = warp::get()
        .and(warp::path::end())
        .map(|| StatusCode::NOT_FOUND);

    let healthz = warp::get()
        .and(warp::path!("healthz"))
        .map(|| StatusCode::OK);

    let routes = root.or(healthz);

    warp::serve(routes)
        .run(([0, 0, 0, 0], 80))
        .await;
}
