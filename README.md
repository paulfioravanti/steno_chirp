# Steno Chirp Application

This is the codebase for the Twitter-style timeline application created during
the [Build a real-time Twitter clone with steno using LiveView and Phoenix
1.6][] video.

It is the same application created by [Chris McCord][], during his [Build a
real-time Twitter clone in 15 minutes with LiveView and Phoenix 1.5][] video.

Artefacts from the steno demo itself can be found in the [`demo/`][] directory.

## Dependencies

- [Elixir][] 1.14.1-otp-25
- [Phoenix][] 1.6

## Setup

```sh
git clone https://github.com/paulfioravanti/steno_chirp.git
cd steno_chirp
mix setup
```

## Run

```sh
mix phx.server
```

Open <http://localhost:4000/posts> in a web browser.

[Build a real-time Twitter clone in 15 minutes with LiveView and Phoenix 1.5]: https://www.youtube.com/watch?v=MZvmYaFkNJI
[Build a real-time Twitter clone with steno using LiveView and Phoenix 1.6]: https://www.youtube.com/watch?v=T_kMd7rxYU0
[Chris McCord]: http://chrismccord.com/
[`demo/`]: ./demo
[Elixir]: https://elixir-lang.org/
[Phoenix]: https://www.phoenixframework.org/
