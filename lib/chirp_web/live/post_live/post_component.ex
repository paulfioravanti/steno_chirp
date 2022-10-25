defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div id={"post-#{@post.id}"} class="post">
      <div class="row">
        <div class="column column-10 post-avatar">
        </div>
        <div class="column column-90 post-body">
          <strong>@<%= @post.username %></strong>
          <br />
          <%= @post.body %>
        </div>
      </div>
      <div class="row">
        <div class="column post-button">
          <%= link to: "#", "phx-click": "like", "phx-target": @myself do %>
            <svg
              viewBox="0 0 24 24"
              width="16"
              height="13"
              stroke="currentColor"
              stroke-width="2"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
              class="css-i6dzq1">
              <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
            </svg>
          <% end %>
          <%= @post.likes_count %>
        </div>
        <div class="column post-button">
          <%= link to: "#", "phx-click": "repost", "phx-target": @myself do %>
            <svg
              viewBox="0 0 24 24"
              width="16"
              height="13"
              stroke="currentColor"
              stroke-width="2"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
              class="css-i6dzq1">
              <polyline points="17 1 21 5 17 9"></polyline>
              <path d="M3 11V9a4 4 0 0 1 4-4h14"></path>
              <polyline points="7 23 3 19 7 15"></polyline>
              <path d="M21 13v2a4 4 0 0 1-4 4H3"></path>
            </svg>
          <% end %>
          <%= @post.reposts_count %>
        </div>
        <div class="column post-button">
          <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
            <svg
              viewBox="0 0 24 24"
              width="16"
              height="13"
              stroke="currentColor"
              stroke-width="2"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
              class="css-i6dzq1">
              <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
              <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
            </svg>
          <% end %>
          <%= link to: "#", "phx-click": "delete", "phx-value-id": @post.id do %>
            <svg
              viewBox="0 0 24 24"
              width="16"
              height="13"
              stroke="currentColor"
              stroke-width="2"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
              class="css-i6dzq1">
              <polyline points="3 6 5 6 21 6"></polyline>
              <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
              <line x1="10" y1="11" x2="10" y2="17"></line>
              <line x1="14" y1="11" x2="14" y2="17"></line>
            </svg>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("like", _unsigned_params, socket) do
    Chirp.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end

  @impl true
  def handle_event("repost", _unsigned_params, socket) do
    Chirp.Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
  end
end
