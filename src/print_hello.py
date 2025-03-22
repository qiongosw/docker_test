import debugpy

# Allow debugger to attach to the container on port 5678
print("Waiting for debugger to attach...")
debugpy.listen(("0.0.0.0", 5678))
debugpy.wait_for_client()  # Pause execution until debugger attaches
print("Debugger attached. Running script...")

welcome = "Hello from Docker with Debugger!"
breakpoint()
print("test debuggerpy")
breakpoint
print(welcome)
