import numpy as np


INF = 2 ** 30


def random_graph(n, p, low=1, high=1000):
    """
    Generate a random simple graph where the weight of each edge is in [1, 100]

    :param n: The number of vertices
    :param p: The probability an edge presents
    :return: A list of edges. Each edge is a triple (from, to, weight)
    """
    adj = np.random.rand(n, n)
    adj = (adj < p).astype(int)
    weights = low + (high - low) * np.random.rand(n, n)
    edges = []
    for u in range(n):
        for v in range(n):
            if u == v or not adj[u][v]:
                continue
            edges.append((u, v, weights[u][v]))
    return edges


def floyd(n, edges):
    dist = np.ones([n, n], dtype=np.int64)
    dist -= np.diag(np.ones(n, dtype=np.int64))
    dist *= INF
    for u, v, w in edges:
        dist[u][v] = w

    for k in range(n):
        for i in range(n):
            for j in range(n):
                if dist[i][j] > dist[i][k] + dist[k][j]:
                    dist[i][j] = dist[i][k] + dist[k][j]
    return dist


def main():
    n = 100
    p = 0.2
    edges = random_graph(n, p)
    with open("shortest_path.in", "w") as f:
        f.write("%d %d\n" % (n, len(edges)))
        for u, v, w in edges:
            f.write("%d %d %d\n" % (u, v, w))

    dist = floyd(n, edges)
    with open("shortest_path.ans", "w") as f:
        for u in range(n):
            for v in range(n):
                f.write("%d " % (dist[u][v] if dist[u][v] != INF else -1))
            f.write("\n")


if __name__ == '__main__':
    main()
