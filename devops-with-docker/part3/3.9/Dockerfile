# Stage 1: Build the Go binary
FROM golang:1.16 AS build

WORKDIR /usr/src/app

COPY ./ ./

RUN go build -o server

# Stage 2: Create a minimal image to run the binary
FROM scratch

# Copy the compiled binary from the build stage
COPY --from=build /usr/src/app/server /server

# Add non-root user
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

USER appuser

# Set environment variables
ENV PORT=8080
ENV REQUEST_ORIGIN=https://example.com

# Expose the necessary port
EXPOSE 8080

# Run the Go binary
CMD ["/server"]
