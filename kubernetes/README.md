## docker-kubernetes

[Kubernetes](https://github.com/GoogleCloudPlatform/kubernetes) on Fedora.

This image contains all k8s components and its sole purpose is testing.

See the above link for documentation and guides.

## Example

Run kubelet (includes cAdvisor on port 4194):

```
docker run --rm --name kubelet -p 4194:4194 -p 10250:10250 -p 10255:10255 \
-v /run:/run -v /sys:/sys:ro -v /var/lib/docker:/var/lib/docker:ro \
--privileged nightling/kubernetes kubelet
```
