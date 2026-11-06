-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename) 
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Project Table
-- ========================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(200) NOT NULL,
    project_date DATE NOT NULL,
    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id) 
        REFERENCES organization (organization_id)
        ON DELETE CASCADE
);

-- ========================================
-- Insert sample data: Service Projects
-- ========================================
INSERT INTO project (organization_id, title, description, location, project_date) VALUES
-- BrightFuture Builders (Org 1)
(1, 'Community Park Bench Assembly', 'Building wooden benches across city parks.', 'Springville City Park', '2026-06-15'),
(1, 'Affordable Housing Framing Day', 'Assisting with wall framing for new homes.', '120 West Center St', '2026-07-10'),
(1, 'Elementary School Ramp Construction', 'Constructing ramps for local school entrances.', 'Cherry Creek Elementary', '2026-08-05'),
(1, 'Neighborhood Bus Shelter Renovation', 'Repairing public transit shelters.', 'Main Street & 400 South', '2026-09-12'),
(1, 'Community Center Roof Repair', 'Replacing damaged shingles on the youth center.', 'Springville Youth Center', '2026-10-01'),

-- GreenHarvest Growers (Org 2)
(2, 'Spring Urban Garden Planting', 'Planting greens for the local food bank.', 'Community Garden Lot A', '2026-05-20'),
(2, 'High-Tunnel Greenhouse Build', 'Constructing a protective poly-tunnel.', 'South Valley Farm', '2026-06-25'),
(2, 'Drip Irrigation System Install', 'Laying drip lines across community plots.', 'Eastside Garden Plot', '2026-07-18'),
(2, 'Compost Bin Construction Workshop', 'Building cedar compost bins.', 'Civic Center Lawn', '2026-08-22'),
(2, 'Autumn Harvest & Distribution', 'Gathering ripe produce for food pantries.', 'Harvest Central Hub', '2026-09-30'),

-- UnityServe Volunteers (Org 3)
(3, 'Canyon Trail Cleanup & Maintenance', 'Clearing fallen debris on walking trails.', 'Hobble Creek Canyon Trailhead', '2026-06-01'),
(3, 'Senior Citizen Yard & Home Care', 'Lawn mowing and window washing for seniors.', 'Springville Senior District', '2026-07-08'),
(3, 'Annual School Supply Drive Packing', 'Packing backpacks for local children.', 'Community Memorial Hall', '2026-08-15'),
(3, 'Veterans Memorial Park Restoration', 'Power-washing stone monuments.', 'Veterans Memorial Grounds', '2026-09-05'),
(3, 'Winter Coat Drive Prep & Sorting', 'Sorting donated winter outerwear.', 'UnityServe Warehouse', '2026-10-15');